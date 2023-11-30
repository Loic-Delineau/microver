#! /bin/bash

# ====================================================================================
# 			   Initial Package Update & Upgrade
# ====================================================================================
sudo apt-get update && sudo apt-get upgrade -y



# ====================================================================================
# 				Core Tools Installation
# ====================================================================================
sudo apt install vim -y
sudo apt install htop -y
sudo apt install neofetch -y
sudo apt install git -y
sudo apt install build-essential -y


# ====================================================================================
# 				ROS Humble Installation
# ====================================================================================
# ROS INSTALLATION
locale  # check for UTF-8

sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8 
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 
export LANG=en_US.UTF-8

locale  # verify settings

# Adding sources
sudo apt install software-properties-common -y
sudo add-apt-repository universe

# Adding ROS2 GPG key
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Adding Repo to sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Installing ROS
sudo apt update && sudo apt upgrade -y

sudo apt install ros-humble-ros-base #CLI version of ROS
sudo apt install ros-dev-tools


# Sourcing ROS & adding it to bashrc
source /opt/ros/humble/setup.bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc



# ====================================================================================
# 				Closing Messages 
# ====================================================================================
sudo apt update && sudo apt upgrade -y

sleep 2

echo ""
echo "Install script is done"
echo ""
echo "Made,"
echo "with Love,"
echo "by Loïc"
echo ""


