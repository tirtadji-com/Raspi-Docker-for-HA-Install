#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#
#
# Docker & Docker-Compose installer for Raspbian Buster
# Basic script for server
###############################################################
NEW_USER=$1

while [[ $NEW_USER = "" ]]; do
   read -p "Please insert the new username, eg. john: " NEW_USER
done

## Begin Docker Installation
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Making user
usermod -aG docker $NEW_USER

echo -e "Docker Installed \e[32m[DONE]\033[0m"