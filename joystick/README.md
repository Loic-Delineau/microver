# Plugged in devices appear in /dev/input as an event file
# - event files are not openable as they are in binary
# - they appear when a device is plugged in and has a known 
# 	Manufacturer 	ID
#	Device 		ID
# - the device driver written in the linux kernel is responsible of this

# Load kernel modules to handle USB gamepads
sudo modprobe usbhid
sudo modprobe joydev

# Plug in USB joystick

# Lists usb devices
lsusb

# Lists currently plugged in device
ls /dev/input

# Lists currently plugged in devices recognised as joysticks
ls /dev/input/js*

# Displays ASCII bullshit that encodes the input from the device
# (Change js0 with event name of device plugged in)
cat /dev/input/js0

# Shows information about all the devices plugged in
cat /proc/bus/input/devices

# Shows messages from the kernel
sudo dmesg

# Try out your joystick using jstest terminal display of joystick
# (replace js0 with event name of device) 
sudo jstest /dev/input/js0

# Configure your joystick using jstest-gtk GUI application
jstest-gtk



