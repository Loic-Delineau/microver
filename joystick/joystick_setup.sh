#!/bin/bash

# Checking for root privileges
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Loading kernel modules
echo "Modifying your /etc/modules file to automatically load the joydev module"
echo "in your kernel on startup"
echo "# Joystick module for game controllers" >> /etc/modules
echo "joydev" >> /etc/modules
echo "usbhid" >> /etc/modules


