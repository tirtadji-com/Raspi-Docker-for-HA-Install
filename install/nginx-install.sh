#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#
#
# NGINX installer for Raspbian Buster
# Basic script for server
###############################################################
# Install ubuntu NGINX
apt install -y nginx

cp -r ~/nginx-files/custom-snippets /etc/nginx/
cp ~/nginx-files/dhparam4096.pem /etc/ssl/certs/
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
cp ~/nginx-files/nginx.conf /etc/nginx/

service nginx restart

echo -e "Installing NGINX \e[32m[DONE]\033[0m"