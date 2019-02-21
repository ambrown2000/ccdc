#!/bin/bash

read domain -p "enter the domain to log in to: " 

yum install adcli sssd authconfig ntpdate -y

Not-date $domain

adcli join $domain

authconfig --enablesssd --enablesssdauth --enablemkhomedir --update

chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf

service sssd start
chkconfig sssd on

