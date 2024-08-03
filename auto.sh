#!/bin/bash

# Function to display colored messages
function print_message() {
    echo -e "\e[1;34m $1 \e[0m"
}

# Check if script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Update package list and install prerequisites
print_message "Installing sudo and wget"
apt update
apt install -y sudo wget

# Create a new user 'steam' and switch to this user
print_message "Creating steam user"
useradd -m steam
echo "Please set a password for the steam user"
passwd steam

# Install SteamCMD
print_message "Installing SteamCMD"
# Detect the Linux distribution and install SteamCMD accordingly
if [ -f /etc/lsb-release ]; then
    # Ubuntu
    print_message "Detected Ubuntu. Installing SteamCMD for Ubuntu"
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y steamcmd
elif [ -f /etc/debian_version ]; then
    # Debian
    print_message "Detected Debian. Installing SteamCMD for Debian"
    sudo apt update
    sudo apt install -y software-properties-common
    sudo apt-add-repository non-free
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y steamcmd
else
    echo "Unsupported Linux distribution"
    exit 1
fi

# Switch to steam user and set up SteamCMD
print_message "Setting up SteamCMD"
sudo -u steam -s <<EOF
cd /home/steam
steamcmd +login anonymous +force_install_dir /home/steam/arma3 +app_update 233780 -beta creatordlc validate +quit
EOF

# Download the config file
print_message "Downloading the config file"
sudo -u steam wget -O /home/steam/arma3/config.cfg https://raw.githubusercontent.com/raf181/Arma3-Config/main/config.cfg

# Modify the config file (optional step, user can do it manually)
print_message "Modify the config file using a text editor if necessary"
sudo -u steam nano /home/steam/arma3/config.cfg

# Run the Arma server
print_message "Running the Arma 3 server"
sudo -u steam /home/steam/arma3/arma3server_x64 -config=/home/steam/arma3/config.cfg

print_message "Arma 3 server setup completed"
