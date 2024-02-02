#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modifed: 01/02/2024
# Description: this script add an entry to ldap server

if [ $# -ne 1 ]; then
	echo "Usage: $0 <ip/name dlap server>"
	exit 1
fi

ldapsearch -x -H ldap://$1 -b "dc=solea,dc=local" -s sub -D "cn=admin,dc=solea,dc=local" -W
