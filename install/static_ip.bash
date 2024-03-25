#!/bin/bash

# First we uninstall dhcpcd and the config file for caution --------------------------
sudo apt remove dhcpcd5 -y
sudo rm -f /etc/dhcpcd.conf 

# Second we install and start the DHCPCD daemon --------------------------------------
sudo apt install dhcpcd5 -y

sudo service dhcpcd status # Should return not working

sudo service dhcpcd start
sudo systemctl enable dhcpcd

echo ""
sudo service dhcpcd status # Should return active

# Third we generate the config file for the dhcpcd daemon ----------------------------
echo "Now generating the network config file for your Raspberry Pi 3B+"
echo "Find it here:	/etc/dhcpcd.conf"

# Creating the config file
sudo rm -f /etc/dhcpcd.conf #-f flag to not give error if file doesn't exist
sudo touch /etc/dhcpcd.conf

# Adding everything to it
echo "#Configuration of static IP Address - Made, with Love, by Loic" >> /etc/dhcpcd.conf
echo "interface wlan0" >> /etc/dhcpcd.conf
echo "static ip_address=192.168.174.169/24" >> /etc/dhcpcd.conf
echo "static routers=192.168.174.2" >> /etc/dhcpcd.conf
echo "static domain_name_servers=192.168.174.2" >> /etc/dhcpcd.conf

echo ""
echo "Script has sucessfully generated dhcpcd.conf in the /etc directory"
echo "Your new static IP address is:"
echo "192.168.174.169"
sleep 1
echo ""
echo "We will now need to reboot to apply configuration"
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
sudo reboot

