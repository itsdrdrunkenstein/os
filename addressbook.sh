

Create()
{
echo "Enter the addressbook name"
read bookname
res=`ls | grep $bookname | wc -w`

	if [ $res -gt 0 ]
	then
	echo "File already exits"

	else
	touch $bookname
	echo "File Created "
	fi

}

Display()
{
echo "Enter the addressbook name to be Displayed"
read bookname
res=`ls | grep $bookname | wc -w`

        if [ $res -gt 0 ]
        then
        echo "File found"
	cat $bookname

        else
        echo "File not found "
        fi
}


Insert()
{
echo "Enter the addressbook name in which you want to insert data"
read bookname
res=`ls | grep $bookname | wc -w`

        if [ $res -gt 0 ]
        then
	echo "File Found"
        echo "Enter Rollno"
	read rollno
	duplicate=`cat $bookname | grep $rollno |wc -w`
		if [ $duplicate -gt 0 ]
		then
		echo "Entry already exist"
		return
		fi

        echo "Enter name"
	read name
	echo $rollno $name >>$bookname
	echo "entry made successfully"
        fi

}

Delete()
{
echo "Enter the addressbook name to delete entries"
read bookname
res=`ls | grep $bookname | wc -w`

        if [ $res -gt 0 ]
        then
        echo "Enter Rollno"
        read rollno
        duplicate=`cat $bookname | grep $rollno |wc -w`
                if [ $duplicate -gt 0 ]
                then
                old=`cat $bookname | grep $rollno`
                sed -i s/"$old"//g $bookname
		sed -i /^$/d $bookname
		echo "Record is deleted"
                else
                echo "Roll number does not exist"
                fi
        else
        echo "Address book does not exist"
        fi

}

Modify()
{
echo "Enter the addressbook name to modfiy"
read bookname
res=`ls | grep $bookname | wc -w`

        if [ $res -gt 0 ]
        then
        echo "Enter Rollno"
        read rollno
        duplicate=`cat $bookname | grep $rollno |wc -w`
                if [ $duplicate -gt 0 ]
                then
		old=`cat $bookname | grep $rollno`
		echo "Old entery = $old"
                echo "Enter new name"
		read newname
		new=`echo "$rollno $newname"`
		echo "New Entry =$new"

		sed -i s/"$old"/"$new"/g $bookname
		else
		echo "Roll number does not exist"
		fi
	else
	echo "Address book does not exist"
	fi

}
while(true)
	do
	echo "                       "
	echo "-----------Menu---------"
	echo "1)Create"
	echo "2)Display"
	echo "3)Insert"
	echo "4)Modify"
	echo "5)Delete"
	echo "6)Exit"
	echo "Enter Choice :"
	read choice

	case $choice in
			1)Create;;
			2)Display;;
			3)Insert;;
			4)Modify;;
			5)Delete;;
			6)exit;;
			*)echo "Wrong choice"
			exit
	esac
done
