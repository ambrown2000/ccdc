#!/bin/bash

yum install adcli sssd authconfig -y

adcli join ccdc.com

authconfig --enablesssd --enablesssdauth --enablemkhomedir --update

chown root:root /etc/sssd/sssd.conf
chmod 600 /etc/sssd/sssd.conf

service sssd start
chkconfig sssd on

