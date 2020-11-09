#!/bin/bash
###############################################################
#	  Created by Richard Tirtadji
#   Main installer for Raspbian Buster
# 	Basic script for server
###############################################################
apt-get update && apt-get dist-upgrade -y && apt autoremove -y
apt-get -y install unzip

# Check Procedure
LINUX='lsb_release -is'

if [ $(id -u) -ne 0 ]; then
	echo "Run this script as a Root user only" >&2
	exit 1
fi

if [[ $LINUX -ne Raspbian ]]; then
	echo "This script usage only for RaspiOS" >&2
	exit 1
fi
cd ~

wget https://github.com/tirtadji-com/Raspi-Docker-for-HA-Install/archive/main.zip
unzip /root/main.zip -d /root/
result=`ls -F /root/ | grep /`
mv /root/$result/* /root/
rm -r /root/$result
chmod +x /root/*.sh
chmod +x /root/install/*.sh
chmod +x /root/hass/*.sh
chmod +x /root/docker/*.sh
rm /root/main.zip
/root/main.sh
rm /root/main.sh
rm -rf /root/motd
/root/home-assistant.sh
rm /root/home-assistant.sh
rm /root/install/docker-install.sh
rm /root/install/fail2ban-install.sh
rm /root/install/ufw-install.sh
rm /root/install/user-install.sh
rm /root/hass/glances-install.sh
rm /root/hass/samba-install.sh
rm /root/docker/hass-install.sh
rm /root/get-docker.sh

echo -e "HA installation complete"