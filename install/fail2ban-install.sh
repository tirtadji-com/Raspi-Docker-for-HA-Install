#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#
#
# Fail2Ban installer for Raspbian Buster
# Basic script for server
###############################################################
apt-get install -y fail2ban

systemctl start fail2ban
systemctl enable fail2ban

echo -e "Fail2Ban Installed \e[32m[DONE]\033[0m"