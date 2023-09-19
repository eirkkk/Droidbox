#!/bin/bash

# Update package manager
apt update

# Install dependencies
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf
apt install  -y libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf

# Clone Box86 repository
wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list
wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg 
apt update
apt install box86-android:armhf -y

# Clone Box64 repository
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
apt update 
apt install box64-android -y
  
echo "Box64 installation completed."

# Download and install Wine Proton
wget https://github.com/Kron4ek/Wine-Builds/releases/download/proton-8.0-3/wine-proton-8.0-3-amd64.tar.xz 
tar -xf wine-proton-8.0-3-amd64.tar.xz
echo "Removing unpacked archive..."
mv wine-proton-8.0-3-amd64 wine
rm wine-proton-8.0-3-amd64.tar.xz
cp -r wine /opt
rm -rf /root/wine

# Download and install 
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/box64_bash
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/box86_bash
chmod +x /root/box*_bash && cp -r /root/box*_bash /opt
rm -rf /root/box*_bash

# Download VulkanDriveBox.tar.xz
wget https://github.com/eirkkk/Mesa_turnip_termux/releases/download/Eirkkk/VulkanDriveBox.tar.xz

# Copy the downloaded file to /opt
cp -r /root/VulkanDriveBox.tar.xz /opt

# Navigate to /opt
cd /opt

# Extract the contents of VulkanDriveBox.tar.xz
tar -xf /opt/VulkanDriveBox.tar.xz

# Navigate to the 'box' directory
cd /opt/box

# Make all files executable
chmod +x *

# Copy the 'box' directory to /usr/local/bin
cp -r box /usr/local/bin

# Clean up by removing the downloaded file
rm /opt/VulkanDriveBox.tar.xz
rm /root/VulkanDriveBox.tar.xz
cd ~/
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv winetricks /usr/local/bin/
rm -rf /root/winetricks
echo "Installation completed."
