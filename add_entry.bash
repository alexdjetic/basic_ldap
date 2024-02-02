#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modifed: 01/02/2024
# Description: this script add an entry to ldap server

if [ $# -ne 1 ]; then
	echo "Usage: $0 <file.ldif>"
	exit 1
fi

if [ -e "$1" ]; then
	ldapadd -x -D "cn=admin,dc=solea,dc=local" -W -H ldap:/// -f $1
	exit 0
else
	echo "file do not exist...exiting"
	exit 1
fi
