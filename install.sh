#!/bin/sh
# Install script for sys-oled

INSTALL_PATH="/usr/local/"
SYSTEMD_PATH="/etc/systemd/"
DEPS="python3-dev python3-psutil libfreetype6-dev libjpeg-dev build-essential python3-luma.oled"

if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root!"
    exit 1
fi

echo "Installing Dependencies"
apt-get update
apt-get install -y $DEPS

echo "Installing sys-oled files"
cp -fv etc/sys-oled.conf  /etc
cp -frv bin "$INSTALL_PATH"
cp -frv share "$INSTALL_PATH"
cp -frv system "$SYSTEMD_PATH"

echo "Enabling sys-oled at startup"
systemctl daemon-reload
systemctl enable sys-oled.service
