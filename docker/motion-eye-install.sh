#!/bin/bash
###############################################################
# Created by Richard Tirtadji
#
#
# Docker Motion Eye for Raspbian Buster
# Basic script for server
###############################################################
NEW_USER=$1

while [[ $NEW_USER = "" ]]; do
   read -p "Please insert the new username, eg. John: " NEW_USER
done

# Making Directory for docker container 
mkdir /home/$NEW_USER/docker/motioneye
mkdir /home/$NEW_USER/docker/motioneye/recordings

docker run -itd --restart=always --name=motioneye --net=host -p 8765:8765 -v /etc/localtime:/etc/localtime:ro -v /home/$NEW_USER/docker/motioneye:/etc/motioneye -v /home/$NEW_USER/docker/motioneye/recordings:/var/lib/motioneye  ccrisan/motioneye:master-armhf

echo -e "MotionEye installed \e[32m[DONE]\033[0m"