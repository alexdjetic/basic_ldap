#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modifed: 01/02/2024
# Description: this script add an entry to ldap server

if [ $# -ne 1 ]; then
	echo "Usage: $0 <file.ldif> <password>"
	exit 1
fi

if [ -e "$1" ]; then
  if [ $# -eq 2 ]; then
    ldapadd -x -D "cn=admin,dc=solea,dc=local" -w "$2" -H ldap:/// -f "$1"
  else
    ldapadd -x -D "cn=admin,dc=solea,dc=local" -W -H ldap:/// -f "$1"
  fi

	ldapadd -x -D "cn=admin,dc=solea,dc=local" -W -H ldap:/// -f $1
else
	echo "file do not exist...exiting"
	exit 1
fi
