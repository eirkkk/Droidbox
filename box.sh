#!/bin/bash
echo "
deb http://ports.ubuntu.com/ubuntu-ports mantic main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports mantic-updates main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports mantic-backports main restricted universe multiverse
deb http://ports.ubuntu.com/ubuntu-ports mantic-security main restricted universe multiverse
" > /etc/apt/sources.list

dpkg --add-architecture armhf
# Update package manager
apt update
apt upgrade -y
# Install dependencies
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf
apt install  -y libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf zenity libopenvr-dev:armhf wget git  mesa-utils:arm64 xz-utils pulseaudio
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf libgl1-mesa-dri:armhf libgl1-mesa-dev:armhf libgl1-mesa-dev:armhf libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf zenity libopenvr-dev:armhf wget git  mesa-utils xz-utils pulseaudio libcups2:armhf libcairo2:armhf libclang-cpp15:armhf libdatrie1:armhf libdecor-0-0:armhf libdecor-0-plugin-1-cairo:armhf libegl-mesa0:armhf libegl1:armhf libfribidi0:armhf libgbm1:armhf libgl-dev:armhf libgl1:armhf libgl1-amber-dri:armhf libgl1-mesa-dri:armhf libglapi-mesa:armhf libgles2:armhf libglvnd0:armhf libglx-dev:armhf libglx-mesa0:armhf libglx0:armhf libgraphite2-3:armhf libharfbuzz0b:armhf libllvmspirvlib15:armhf libpango-1.0-0:armhf libpangocairo-1.0-0:armhf libpangoft2-1.0-0:armhf libpixman-1-0:armhf libsensors5:armhf libthai0:armhf libvdpau1:armhf libxcb-xkb1:armhf libxkbcommon-x11-0:armhf libxkbcommon0:armhf mesa-common-dev:armhf mesa-drm-shim:armhf mesa-opencl-icd:armhf  mesa-utils-bin:armhf mesa-va-drivers:armhf mesa-vdpau-drivers:armhf ocl-icd-libopencl1:armhf  libglx-mesa0:armhf libxcb-dri3-0:armhf libgl1-mesa* libgl1-mesa*:armhf
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
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/mesa-vulkan-kgsl_23.2.1-20230929_armhf.deb
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/mesa-vulkan-kgsl_23.2.1-20230929_arm64.deb
dpkg -i mesa-vulkan-kgsl*arm64.deb
dpkg -i mesa-vulkan-kgsl*armhf.deb
rm mesa-vulkan-kgsl*arm64.deb mesa-vulkan-kgslarmhf.deb

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
apt install zlib1g-dev:armhf libexpat1-dev:armhf libdrm-dev:armhf libx11-dev:armhf libx11-xcb-dev:armhf libxext-dev:armhf libxdamage-dev:armhf libxcb-glx0-dev:armhf libxcb-dri2-0-dev:armhf libxcb-dri3-dev:armhf libxcb-shm0-dev:armhf libxcb-present-dev:armhf libxshmfence-dev:armhf libxxf86vm-dev:armhf libxrandr-dev:armhf libwayland-dev:armhf wayland-protocols:armhf libwayland-egl-backend-dev:armhf pkg-config:armhf libedit2:armhf libelf1:armhf libicu-dev:armhf libllvm15:armhf liblzma5:armhf libstdc++6:armhf libtinfo6:armhf libvulkan1:armhf libxml2:armhf libzstd1:armhf

echo "Installation completed."
