#!/bin/bash
# Author: Djetic Alexandre
# Date: 04/02/2024
# Modified: 04/02/2024
# Description: this script setup an LDAP server on ubuntu server

#install package
sudo apt install git neovim vim nano curl -y
sudo apt install slapd ldap-utils -y
sudo dpkg-reconfigure slapd
ldapsearch -Q -LLL -Y EXTERNAL -H ldapi:/// -b cn=config dn
ldapsearch -x -LLL -H ldap:/// -b dc=solea,dc=local

#setup firewall
sudo ./setup_firewall.bash

#admin password
echo "give admin password: "
read pass

# add all entry to DLAP server
## OU
ou_order=$(cat list_import_ou.txt)

while IFS= read -r ou; do
  ./add_entry.bash "ou/$ou.ldif" "$pass"
done < "$ou_order"

## user
for user in $(ls user/*.ldif)
do
  ./add_entry.bash $user "$pass"
done

## group
for group in $(ls group/*.ldif)
do
  ./add_entry.bash $group "$pass"
done
