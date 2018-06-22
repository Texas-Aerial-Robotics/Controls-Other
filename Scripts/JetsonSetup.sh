#!/bin/bash

if [ $(id -u) -ne 0 ]; then
   echo >&2 "Must be run as root"
   exit 1
fi

set -e
set -x

# export TELEM_SERIAL_PORT=/dev/ttyS0
chmod 666 /dev/ttyS0

# avahi-daemon for "ssh apsync" over WiFi

# Mess with packages 
apt-get update
apt-get purge -y whoopsie cups bluez modemmanager unattended-upgrades deja-dup printer-driver-* libreoffice-* gnome-mines gnome-sudoku gnome-mahjongg gnome-screensaver rhythmbox example-content aisleriot account-plugin-* brltty duplicity empathy thunderbird
apt-get autoremove -y
apt-get install -y git tcpdump lsof mlocate v4l-utils usbutils tree
apt-get update
apt-get dist-upgrade -y
apt-get clean

for ID in $(cat /etc/passwd | grep /home | cut -d ':' -f1); do (adduser $ID dialout);done
for ID in $(cat /etc/passwd | grep /home | cut -d ':' -f1); do (adduser $ID tty);done

updatedb

sed -i s/'rotate 4'/'rotate 1'/g /etc/logrotate.conf   # keep 1 week of backups
sed -i s/#compress/compress/g /etc/logrotate.conf   # compress backups
perl -pe 's/ console=ttyS0,115200//' -i /boot/extlinux/extlinux.conf
