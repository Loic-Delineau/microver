#!/bin/bash

# First we uninstall dhcpcd and the config file for caution --------------------------
sudo apt remove dhcpcd5 -y
sudo rm -f /etc/dhcpcd.conf 

# Second we install and start the DHCPCD daemon --------------------------------------
sudo apt install dhcpcd5 -y

sudo service dhcpcd start
sudo systemctl enable dhcpcd

echo ""
sudo service dhcpcd status # Should return active
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1

# Third, we find the parameters of the user -----------------------------------------
# Variables
path="./dhcpcd.conf"
ip_device="`hostname -I`"
ip_router="`ip r | awk 'NR==1{print $3 }'`"
ip_dns="`grep "nameserver" /etc/resolv.conf | awk '{ print $2 }'`"

# Making the file
sudo rm -rf "$path"
sudo touch "$path"

# Asking user what IP they want
echo ""
echo "Your IP address is currently: "$ip_device""
echo "Please specify the last three digits of the IP you would like, they must be between 0 and 255!"

ip_new=""
read ip_new

if [[ "$ip_new" > "255" ]]; then
	echo "The IP you entered is bigger than 255 (or not a number), program will exit"
	exit
fi

# IP math
ip_final="`hostname -I | cut -d. -f1-3`."$ip_new""
echo "Your final IP will be: "$ip_final""

# Fourth, we add all of this info to the config file of the user
echo "#Configuration of static IP Address - Made, with Love, by Loic" | sudo tee -a "$path"
echo "interface wlan0" | sudo tee -a "$path"
echo "static ip_address="$ip_final"" | sudo tee -a "$path"
echo "static routers="$ip_router"" | sudo tee -a "$path"
echo "static domain_name_servers="$ip_dns"" | sudo tee -a "$path"

echo ""
echo "Script has sucessfully generated dhcpcd.conf in the /etc directory"
echo "Your new static IP address is:"
echo "$ip_final"
sleep 1
echo ""
echo "We will now need to reboot to apply configuration (hit CTRL-C quickly to stop it)"
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
sudo reboot

