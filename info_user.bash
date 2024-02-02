#!/bin/bash
# Author: Djetic Alexandre
# Date: 01/02/2024
# Modified: 01/02/2024
# Description: this script will show info about a LDAP user

if [ $# -ne 2 ]; then
	echo "Usage: $0 <search domain> <user>"
	exit 1
fi

domain_search="$1"
user="$2"

ldapsearch -x -LLL -H ldap:/// -b "$1" "(uid=$2)" "*"
