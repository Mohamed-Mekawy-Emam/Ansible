#! /bin/bash

echo "Please enter file name"
read -p "file name:" filename

if [ -e $filename ]
then
	echo "File Exist"
else
	echo "File not found do you want to create it? type yes or no"
	read -p "Please Enter yes/no: " VAR
	if [ $VAR == "yes" ]
	then
		touch $filename
		echo "file $filename created"
	elif [ $VAR == "no" ]
	then
		exit
	else
		echo "entered value not allowed please try again"
		exit
	fi
fi
