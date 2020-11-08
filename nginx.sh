#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#  NGINX Only for Raspbian Buster
# 	Basic script for server
###############################################################
# Install NGINX
/root/install/nginx-install.sh

# Install Letsencrypt
/root/install/certbot-install.sh

# Prepare NGINX Config for HASS
/root/hass/nginx-hass-conf.sh

rm -rf /root/hass
rm -rf /root/nginx-files
rm -rf /root/install

echo -e "HA + NGINX installation \e[32m[DONE]\033[0m"