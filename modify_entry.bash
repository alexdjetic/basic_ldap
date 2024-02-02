#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modifed: 01/02/2024
# Description: This script adds an entry to an LDAP server.

if [ $# -ne 1 ]; then
    echo "Usage: $0 <file.ldif>"
    exit 1
fi

LDIF_FILE="$1"
LDAP_ADMIN_DN="cn=admin,dc=solea,dc=local"
LDAP_URI="ldap:///"

# file exist ?
if [ ! -e "$LDIF_FILE" ]; then
    echo "File does not exist... exiting"
    exit 1
fi

# Check if ldapmodify command is available
if ! command -v ldapmodify &> /dev/null; then
    echo "ldapmodify command not found. Please install ldap-utils."
    exit 1
fi

# command
ldapmodify -x -D "$LDAP_ADMIN_DN" -W -H "$LDAP_URI" -f "$LDIF_FILE"

# Check the exit status of the ldapmodify command
if [ $? -eq 0 ]; then
    echo "LDAP modification successful."
    exit 0
else
    echo "LDAP modification failed."
    exit 1
fi
