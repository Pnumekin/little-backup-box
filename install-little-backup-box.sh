#!/usr/bin/env bash

#Install depandancies
sudo apt update && sudo apt dist-upgrade -y && sudo apt install git-core rsync exfat-fuse exfat-utils ntfs-3g build-essential python-dev python-smbus python-pip -y

#Install GPIO
sudo pip install RPi.GPIO

sudo mkdir /media/card
sudo mkdir /media/storage
sudo chown -R pi:pi /media/storage
sudo chmod -R 775 /media/storage
sudo setfacl -Rdm g:pi:rw /media/storage

cd
#Instal Little Big Backup Box
git clone https://github.com/Pnumekin/little-big-backup-box.git

#Install Adafruit LCD lib
git clone https://github.com/adafruit/Adafruit_Python_CharLCD.git

cd Adafruit_Python_CharLCD
sudo python setup.py install


crontab -l | { cat; echo "@reboot sudo /home/pi/little-backup-box/backup.sh > /home/pi/little-backup-box.log"; } | crontab

echo "------------------------"
echo "All done! Please reboot."
echo "------------------------"
