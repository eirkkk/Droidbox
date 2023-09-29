#!/bin/bash

dpkg --add-architecture armhf
# Update package manager
apt update
apt upgrade -y
# Install dependencies
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf
apt install  -y libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf zenity libopenvr-dev:armhf wget git  mesa-utils:arm64 xz-utils pulseaudio

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
wget https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton8-14/wine-lutris-GE-Proton8-14-x86_64.tar.xz
tar -xf wine-lutris-GE-Proton8-14-x86_64.tar.xz
echo "Removing unpacked archive..."
mv lutris-GE-Proton8-14-x86_64 wine
rm wine-lutris-GE-Proton8-14-x86_64.tar.xz
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
apt remove mesa-vulkan-drivers:armhf -y
apt remove mesa-vulkan-drivers:arm64 -y
rm /opt/VulkanDriveBox.tar.xz
rm /root/VulkanDriveBox.tar.xz
cd ~/
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv winetricks /usr/local/bin/
rm -rf /root/winetricks
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/mesa-vulkan-kgsl_23.2.0-rc4-20230929_arm64.deb
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/mesa-vulkan-kgsl_23.2.0-rc4-20230929_armhf.deb
dpkg -i mesa-vulkan-kgsl_23.2.0-rc4*arm64.deb
dpkg -i mesa-vulkan-kgsl_23.2.0-rc4*armhf.deb
rm mesa-vulkan-kgsl_23.2.0-rc4*arm64.deb mesa-vulkan-kgsl_23.2.0-rc4*armhf.deb

echo 'export DISPLAY=:0' >> ~/.bashrc
echo 'export PULSE_SERVER=127.0.0.1' >> ~/.bashrc
echo 'export MESA_LOADER_DRIVER_OVERRIDE=zink' >> ~/.bashrc
echo 'export GALLIUM_HUD=simple,fps' >> ~/.bashrc
echo 'export ENABLE_GAMESCOPE_WSI=1' >> ~/.bashrc
echo 'export MESA_VK_WSI_PRESENT_MODE=immediate' >> ~/.bashrc
echo 'export USE_HEAP=1' >> ~/.bashrc
echo 'export vblank_mode=0' >> ~/.bashrc
echo 'export DXVK_HUD=api,fps,version,devinfo,gpuload' >> ~/.bashrc
echo 'export DXVK_CONFIG_FILE="/opt/DXVK_D8VK.conf"' >> ~/.bashrc
echo 'export BOX64_BASH="/opt/box64_bash"' >> ~/.bashrc
echo 'export BOX64_ALLOWMISSINGLIBS=1' >> ~/.bashrc
echo 'export BOX86_BASH="/opt/box86_bash"' >> ~/.bashrc
echo 'export BOX86_ALLOWMISSINGLIBS=1' >> ~/.bashrc
echo 'export WINEDEBUG=-all' >> ~/.bashrc
echo 'export PATH="$PATH:/opt/wine/bin"' >> ~/.bashrc
echo 'export MESA_NO_ERROR=1' >> ~/.bashrc
echo 'export DXVK_ASYNC=1' >> ~/.bashrc
echo 'export ZINK_DESCRIPTORS=lazy' >> ~/.bashrc
echo 'export ZINK_DEBUG=compact' >> ~/.bashrc
echo 'export WINE_LARGE_ADDRESS_AWARE=0' >> ~/.bashrc
echo 'export PROTON_FORCE_LARGE_ADDRESS_AWARE=0' >> ~/.bashrc
source ~/.bashrc
echo "Installation completed."
