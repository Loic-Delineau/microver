#! /bin/bash

# ====================================================================================
# 			   Initial Package Update & Upgrade
# ====================================================================================

echo ""
echo "Starting the ROS2 Humble install script for your Laptop"
echo ""
echo "This script is for a Ubuntu 22.04.XX Desktop version (with a GUI)"
echo "This script should take between 15 and 30 minutes to finish"

# Wait to let user read
echo ""
sleep 2
echo "."
sleep 2
echo "."
sleep 2
echo "."
sleep 2
echo ""

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

# Adding Sources
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y

# Adding ROS2 GPG Key
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Adding Repo to Sources list
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Installing ROS
sudo apt update && sudo apt upgrade -y

sudo apt install ros-humble-desktop -y #GUI version of ROS
sudo apt install ros-dev-tools -y


# Sourcing ROS & adding it to bashrc
source /opt/ros/humble/setup.bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc


# ====================================================================================
#				 Installing VSCode
# ====================================================================================
sudo apt update && sudo apt upgrade -y

sudo apt install software-properties-common apt-transport-https wget -y

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y

sudo apt install code -y

code --version


# ====================================================================================
# 				Closing Messages 
# ====================================================================================
sudo apt update && sudo apt upgrade -y

sleep 2

echo ""
echo "Install script is done"
echo ""
echo "You can try to launch a publisher & subscriber with:"
echo "ros2 run demo_nodes_cpp talker"
echo "ros2 run demo_nodes_py listener"
echo ""
echo "Made,"
echo "with Love,"
echo "by Loïc"
echo ""



