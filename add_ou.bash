#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modified: 01/02/2024
# Description: This script creates an LDIF file and adds an Organizational Unit (OU) to an LDAP server.

if [ $# -ne 1 ]; then
    echo "Usage: $0 <ou_file.ldif>"
    exit 1
fi

# Property
ldif_file=$1

echo "Enter DN for the Organizational Unit (OU): "
read dn

echo "Enter OU name: "
read ou

# File build
echo "# $ldif_file" > "$ldif_file"
echo "dn: $dn" >> "$ldif_file"
echo "objectClass: organizationalUnit" >> "$ldif_file"
echo "ou: $ou" >> "$ldif_file"

# Summary
cat "$ldif_file"

echo "Is this okay? (y/n)"
read yn

if [ "$yn" == "y" ]; then
    ldapadd -x -D "cn=admin,dc=solea,dc=local" -W -H ldap:/// -f $file
    exit 0
else
    echo "Exiting..."
    exit 1
fi

