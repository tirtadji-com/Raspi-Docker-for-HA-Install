#!/bin/bash
###############################################################
#	  Created by Richard Tirtadji
#   Main installer for Raspbian Buster
# 	Basic script for server
###############################################################
apt-get update && apt-get dist-upgrade -y && apt autoremove -y
apt-get -y install unzip
wget https://github.com/tirtadji-com/Raspi-Docker-for-HA-Install/archive/main.zip
unzip /root/master.zip -d /root/
result=`ls -F /root/ | grep /`
mv /root/$result/* /root/
rm -r /root/$result
chmod +x /root/*.sh
chmod +x /root/install/*.sh
chmod +x /root/hass/*.sh
chmod +x /root/docker/*.sh
./checking.sh
rm /root/master.zip
/root/main.sh
rm /root/main.sh
/root/home-assistant.sh
rm /root/home-assistant.sh
#reboot now