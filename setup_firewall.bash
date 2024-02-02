#!/bin/bash
# Author: Djetic Alexandre
# Date: 04/02/2024
# Modified: 04/02/2024
# Description: this script setup the firewall for LDAP server

#install package
sudo apt install ufw -y  

#firewall
ufw enable
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 389/tcp
ufw allow 631/tcp
ufw allow 53/tcp
ufw status
sudo ufw reload
