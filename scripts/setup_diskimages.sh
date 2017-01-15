#!/bin/bash
echo -e "---------------------------------------------------------------------------"
echo -e "This script will make the default directories for SpacePanel and download several ISOs for your local VMs:"
echo -e "---------------------------------------------------------------------------"
echo -e ""
echo -e "Configurations: /var/configs"
echo -e "Images: /var/images"
echo -e "Disks: /var/disks"
echo -e ""

read -r -p "Would you like to make the default directories? [y/N]:" response

if [[ $response =~ ^(yes|y| ) ]]; then
    mkdir /var/configs /var/images /var/disks
fi

echo -e "This script can also download several ISOs to get started with your local VMs."
echo -e " "
read -r -p "Would you like to download Centos 6.8? [y/N]" response1
echo -e " "

if [[ $response1 =~ ^(yes|y| ) ]]; then
    wget http://pubmirrors.dal.corespace.com/centos/6.8/isos/x86_64/CentOS-6.8-x86_64-minimal.iso -P /var/images 
fi

echo -e " "
read -r -p "Would you like to download Centos 7 Minimal? [y/N]" response2
echo -e  " "

if [[ $response2 =~ ^(yes|y| ) ]]; then
    wget http://repos.dfw.quadranet.com/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso -P /var/images
fi

echo -e " "
read -r -p "Would you like to download Debian 8.6 Netinstall? [y/N]" response3
echo -e " "

if [[ $response3 =~ ^(yes|y| ) ]]; then
    wget http://cdimage.debian.org/debian-cd/8.6.0/amd64/iso-cd/debian-8.6.0-amd64-netinst.iso -P /var/images
fi

echo -e " "
read -r -p "Would you like to download Ubuntu 16.04.1? [y/N]" response4
echo -e " "

if [[ $response4 =~ ^(yes|y| ) ]]; then
    wget http://releases.ubuntu.com/16.04/ubuntu-16.04.1-server-amd64.iso -P /var/images
fi
