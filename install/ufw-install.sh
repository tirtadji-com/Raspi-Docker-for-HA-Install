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
ufw --force enable

service ufw start

echo -e "Firewall Installation \e[32m[DONE]\033[0m"