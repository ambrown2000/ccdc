#!/bin/bash

echo "enter domain to log in to: "

read domain 

yum install adcli sssd authconfig ntpdate -y

ntpdate $domain

adcli join $domain

authconfig --enablesssd --enablesssdauth --enablemkhomedir --update

chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf

service sssd start
chkconfig sssd on

