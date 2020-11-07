#!/bin/bash
###############################################################
#	Created by Richard Tirtadji
#
#
# Checking for uBuntu 18.04/20.04
# Basic script for server
###############################################################
# Install Checking
LINUX='lsb_release -is'

if [ $(id -u) -ne 0 ]; then
	echo "Run this script as a Root user only" >&2
	exit 1
fi

# if [[ $LINUX -ne Ubuntu ]]; then
# 	echo "This script usage only for UBuntu" >&2
# 	exit 1
# fi

echo "You are running as ROOT and `$LINUX` OS"
