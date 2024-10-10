#!/bin/bash

# Update package lists
sudo apt update

# Install required packages
sudo apt -y install wget gnupg dirmngr

# Import Kali's archive key
sudo wget -q -O - https://archive.kali.org/archive-key.asc | gpg --import

# Add Kali's public key from Ubuntu keyserver
sudo gpg --keyserver keyserver.ubuntu.com --recv-key 44C6513A8E4FB3D30875F758ED444FF07D8D0BF6

# Add Kali repositories to sources.list
sudo sh -c "echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list"
sudo sh -c "echo 'deb http://http.kali.org/kali kali-last-snapshot main non-free contrib' >> /etc/apt/sources.list"

# Export and add the GPG key to the APT keyring
sudo gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -

# Update package lists and upgrade the system
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade

# Remove unused packages and clean up
sudo apt -y autoremove --purge

# Install the complete Kali Linux package
sudo apt -y install kali-linux-everything
