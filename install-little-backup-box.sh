#!/usr/bin/env bash

sudo apt update && sudo apt dist-upgrade -y && sudo apt install git-core rsync exfat-fuse exfat-utils ntfs-3g -y

sudo mkdir /media/card
sudo mkdir /media/storage
sudo chown -R pi:pi /media/storage
sudo chmod -R 775 /media/storage
sudo setfacl -Rdm g:pi:rw /media/storage

cd
git clone https://github.com/Pnumekin/little-big-backup-box.git

crontab -l | { cat; echo "@reboot sudo /home/pi/little-backup-box/backup.sh > /home/pi/little-backup-box.log"; } | crontab

echo "------------------------"
echo "All done! Please reboot."
echo "------------------------"
