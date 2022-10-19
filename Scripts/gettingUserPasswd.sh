#! /bin/bash

#Account Validation
#-S, --status Display account status information. The status information consists of 7 fields. The first field is the user's login name. The second field indicates if the user account has a locked password (L), has no password (NP), or has a usable password (P). The third field gives the date of the last password change. The next four fields are the minimum age, maximum age, warning period, and inactivity period for the password. These ages are expressed in days.

echo "Current Logged in user is :$USER"

if [ "$(passwd -S "$USER" | cut -d ' ' -f 2)" = "P" ]
then   
    echo "Account is enabled"
else
    echo "Account is locked or disabled"
fi

#Getting $USER hased password
userPassword=`sudo grep -i $USER /etc/shadow | awk -F ":" '{print $2}'`
echo "$USER hashed password is: $userPassword"

#another tries 
#userPassword=`sudo cat /etc/shadow |grep $USER|awk -F\: '{print$2}'`
#sudo awk -F: '/<username>/ {if(substr($2,1,1) == "!"){print "True"} else {print "False"}}' /etc/shadow
#sudo awk -v userName="$USER" -F: '/userName/ {if(substr($2,1,1) == "!"){print "True"} else {print "False"}}' /etc/shadow
