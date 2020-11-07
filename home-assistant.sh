#!/bin/bash
###############################################################
#	  Created by Richard Tirtadji
#   Main installer for Raspbian Buster
# 	Basic script for server
###############################################################
NEW_USER=$1
while [[ $NEW_USER = "" ]]; do
   read -p "Please insert the new username, eg. john: " NEW_USER
done

# Begin Installation
/root/install/user-install.sh $NEW_USER

read -p "Do you want to install NGINX (y/n): " NGX

if [ "$NGX" != "${NGX#[Yy]}" ]; then

# Install NGINX
/root/install/nginx-install.sh

# Install Letsencrypt
/root/install/certbot-install.sh

# Prepare NGINX Config for HASS
/root/hass/nginx-hass-conf.sh

else

fi

# Install Fail2Ban
/root/install/fail2ban-install.sh

# Install Docker
/root/install/docker-install.sh

# Install Samba
/root/hass/glances-install.sh

# Install Samba
/root/hass/samba-install.sh $NEW_USER

# Install HASS
/root/docker/hass-install.sh $NEW_USER

echo -e "HASS.core Server installation \e[32m[DONE]\033[0m"