#!/bin/bash
# Author: Djetic Alexandre
# Date: 02/02/2024
# Modified: 02/02/2024
# description: this script create a LDAP groups without member

if [ $# -ne 1 ]; then
  echo "Usage: $0 <file.ldif>"
  exit 1
fi

LDIF_FILE="$1"

echo "give a name: "
read name

echo "give an ID: "
read id

echo "give a description: "
read desc

echo "dn: cn=$name,ou=groups,ou=aix,dc=solea,dc=local" > $LDIF_FILE
echo "objectClass: top" >> $LDIF_FILE
echo "objectClass: posixGroup" >> $LDIF_FILE
echo "gidNumber: $id" >> $LDIF_FILE
echo "cn: $name" >> $LDIF_FILE
echo "description: $desc" >> $LDIF_FILE

cat $LDIF_FILE
