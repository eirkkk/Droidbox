#!/bin/bash

# Update package manager
apt update

# Install dependencies
apt install -y git build-essential cmake wget gcc-arm-linux-gnueabihf zenity:armhf libasound*:armhf libstdc++6:armhf 
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf

# Clone Box86 repository
git clone https://github.com/ptitSeb/box86

# Build and install Box86
cd box86
mkdir build && cd build
cmake .. -DARM64=1 -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD845=ON 
make -j8
make install

# Clean up Box86 repository
cd /root
rm -r box86

echo "Box86 installation completed."

# Clone Box64 repository
git clone https://github.com/ptitSeb/box64

# Build and install Box64
cd box64
mkdir build && cd build
cmake .. -DARM_DYNAREC=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBAD_SIGNAL=ON -DSD845=ON
make -j8
make install

# Clean up Box64 repository
cd /root
rm -r box64

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
