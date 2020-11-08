# This installation will help you install
RaspiOS with NGINX, Letsencrypt, Glance with Docker Portainer, Watch Tower, InfluxDB, Grafana, MotionEye, TasmoAdmin, MQTT, and  Home-Assistant 

# Requirement:
- Rasberry Pi 4
- microSD
- [RaspiOS](https://downloads.raspberrypi.org/raspios_armhf_latest)
- [Raspbian Imager](https://www.raspberrypi.org/downloads/)
- Your public ssh keys (please google it on how to create one for you) 

# Installation:
step 1: Burn your microSD using Raspberry Pi Imager  
step 2: Remove your microSD and reinsert to your PC/notebook  
step 3: Now go to your microSD directory `/boot` and be sure to type using terminal `touch ssh` (we are going to install HA headless)  
step 4: Boot your microSD on Raspberry Pi and find the local IP  
step 5: Now SSH to your RPI by using `ssh pi@local-ip` password `raspberry`  
step 6: Once connected you need to `sudo passwd` and insert your root password (twice)  
step 7: Then you need to change to ROOT by typing `su` and enter your root password  
step 8: Now you will need to change directory to root by typin `~`  

## Richard Raspbian Buster Installer Scripts
Run this installer to complete the installations

```
# Run this first and reboot your system
apt-get update && apt-get dist-upgrade -y && apt autoremove -y
reboot now
```

Then execute the rest of the script
```
wget https://raw.githubusercontent.com/tirtadji-com/Raspi-Docker-for-HA-Install/main/install.sh
```

Now you will need to chmod and execute the scripts from your ROOT Directory
```
# Next you will need to chmod the files
chmod +x install.sh

# Execute the script
./install.sh

```



# More Docker-Apps
If you want to install more docker then you will have to run each individual script inside docker directory accept for hass-install.sh  
To install simply by `cd /root/docker` and type `./[docker-apps]-install.sh`

# Docker-Apps:
- Grafana running on port 3000
- ESP Home running on port 6052
- InfluxDB running on port 8086
- MotionEye running on port 8765
- MQTT running on port 1883
- TasmoAdmin running on port 9003
- WatchTower

# Non Docker-Apps:
- Glaces running on port 61208
- Home-Assistant on port 8123

# WARNING!
Before you run NGINX installation make sure you open your router port 80/443 and directed to your RPI-ip else you dont need to install NGINX

In order to setup correctly you will need to run this command from your `/root/` directory as *ROOT*
