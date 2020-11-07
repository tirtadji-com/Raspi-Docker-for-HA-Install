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

# Setup time for my timezone
timedatectl set-timezone '$TZONE'

# Ubuntu Update
apt-get update && apt-get dist-upgrade -y && apt autoremove -y
apt-get install -y git figlet lolcat debconf-utils curl wget gnupg2 ca-certificates lsb-release apt-transport-https

SSH_ROOT=~/.ssh

[ ! -d "$SSH_ROOT" ] && mkdir -p "$SSH_ROOT"
chmod 700 $SSH_ROOT 
cat <<EOF >$SSH_ROOT/authorized_keys
# Authorization created especially for KRDesigns.com
$PUB_KEY
EOF

chmod 600 $SSH_ROOT/authorized_keys

sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config
sed -i 's/#\?\(PermitEmptyPasswords\s*\).*$/\1 no/' /etc/ssh/sshd_config
sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 no/' /etc/ssh/sshd_config
sed -i 's/#\?\(Banner\s*\).*$/\1 \/etc\/issue.net/' /etc/ssh/sshd_config

echo "KexAlgorithms curve25519-sha256,curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256" >> /etc/ssh/sshd_config
echo "MACs umac-128-etm@openssh.com,hmac-sha2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512" >> /etc/ssh/sshd_config

MOTD_ROOT=/root/motd

# Making MOTD
BANNER_F1=(/etc/update-motd.d/00*)
BANNER_F2=(/etc/update-motd.d/10*)
BANNER_F3=(/etc/update-motd.d/50*)
BANNER_F4=(/etc/update-motd.d/80*)

if [[ -f ${BANNER_F1[0]} ]]
then
  rm $BANNER_F1
fi

if [[ -f ${BANNER_F2[0]} ]]
then
  rm $BANNER_F2
fi

if [[ -f ${BANNER_F3[0]} ]]
then
  rm $BANNER_F3
fi

if [[ -f ${BANNER_F4[0]} ]]
then
  rm $BANNER_F4
fi

# Moving file MOTD
cp $MOTD_ROOT/* /etc/update-motd.d/ 
chmod +x /etc/update-motd.d/*

# HOSTNAME setup
hostnamectl set-hostname $HOST_NAME
echo "127.0.0.1 $HOST_NAME" >> /etc/hosts

# Making a new banner
cat <<EOF >/etc/issue.net
###############################################################
#  Welcome to $HOST_NAME                 
#                                                             
#  All connections are monitored and recorded          
#                                                             
#  Disconnect IMMEDIATELY if you are not an authorized user!  
###############################################################
EOF

service ssh restart

rm -r $MOTD_ROOT