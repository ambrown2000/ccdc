#!/bin/bash
echo "Edit Passwords"
#List users with UID over 1000

if [ "$#" -ne 1 ]; then 
	echo "Usage: sudo $0 <password>"
fi

cut -d: -f1,3 /etc/passwd | egrep ':[0-9][0-9][0-9][0-9]S' | cut -d: -f1 > u$
echo root >> usersover1000
for user in `cat usersover1000`
do
   echo $user password being changed
   echo $user:'$1' | chpasswd
        if [ "$?" -eq "0" ]; then
                echo "Password change successful"
                
        else
                echo "Password change failed"
                

        fi
done

rm userover1000

