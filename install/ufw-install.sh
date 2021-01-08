#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#
#
# UFW installer for Raspbian Buster
# Basic script for server
###############################################################
# Install firewall
apt install ufw

ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http 
ufw allow https
ufw allow 3000
ufw allow 6052
ufw allow 8086
ufw allow 8765
ufw allow 1883
ufw allow 9003
ufw --force enable

service ufw start

echo -e "Firewall Installation \e[32m[DONE]\033[0m"
