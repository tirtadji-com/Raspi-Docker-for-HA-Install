#!/bin/bash
###############################################################
#	  Created by Richard Tirtadji
#   Main installer for Raspbian Buster
# 	Basic script for server
###############################################################
TZONE=$1
PUB_KEY=$2
HOST_NAME=$3

while [[ $TZONE = "" ]]; do
  read -p "Write your timezone eg, Asia/Jakarta: " TZONE
done

while [[ $PUB_KEY = "" ]]; do
  read -p "Write your public key (long string of code starting with ssh-rsa), eg. ssh-rsa: " PUB_KEY
done

while [[ $HOST_NAME = "" ]]; do
  read -p "The name of your server host: " HOST_NAME
done


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
./checking.sh
rm /root/main.zip
/root/main.sh $TZONE $PUB_KEY $HOST_NAME
rm /root/main.sh 
/root/home-assistant.sh
rm /root/home-assistant.sh
#reboot now