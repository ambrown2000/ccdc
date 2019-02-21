#!/bin/bash

echo "Enter domain:"

read domain

yum -y install realmd sssd oddjob oddjob-mkhomedir adcli samba-common

realm join $domain

