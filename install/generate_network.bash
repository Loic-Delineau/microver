#!/bin/bash
echo "This script will generate the network config for your Raspberry Pi 3B+"

#Creating the new File
rm -f networkbis.txt #-f flag to not give error if file doesn't exist
touch networkbis.txt

echo "#Configuration of static IP Address - Made, with Love, by Loic" >> networkbis.txt
echo "interface wlan0" >> networkbis.txt
echo "static ip_address=192.168.174.169/24" >> networkbis.txt
echo "static routers=192.168.174.2" >> networkbis.txt
echo "static domain_name_servers=192.168.174.2" >> networkbis.txt

echo "Script has sucessfully generated networkbis.txt in the current directory"

