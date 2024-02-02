#!/bin/bash
# Author: Djetic Alexandre
# Date: 04/02/2024
# Modified: 04/02/2024
# Description: this script setup an LDAP server on ubuntu server

sudo apt install git neovim vim nano curl -y
sudo apt install slapd ldap-utils -y
sudo dpkg-reconfigure slapd
ldapsearch -Q -LLL -Y EXTERNAL -H ldapi:/// -b cn=config dn
ldapsearch -x -LLL -H ldap:/// -b dc=solea,dc=local
sudo systemctl start slapd
sudo systemctl status slapd

sudo ./setup_firewall.bash
