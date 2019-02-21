#!/bin/bash
echo "Edit Passwords"
#List users with UID over 1000

if [ "$#" -ne 1 ]; then 
	echo "Usage: sudo $0 <password>"
fi

cut -d: -f1,3 /etc/passwd | egrep ':[0-9][0-9][0-9][0-9]' | cut -d: -f1 > usersover1000
echo root >> usersover1000
for user in `cat usersover1000`
do
   echo $user:'$1' | chpasswd
        if [ "$?" -eq "0" ]; then
                echo "$user password change successful: $1"
                
        else
                echo "$user password change failed"
                

        fi
done

rm usersover1000

history -c
 
rm ~/.bash_history

