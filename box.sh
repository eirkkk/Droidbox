#!/bin/bash
echo 'nameserver 1.1.1.1' >> /etc/resolv.conf
dpkg --add-architecture armhf
# Update package manager
apt update
apt upgrade -y
clear
# Install dependencies
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev libxkbcommon-dev libxkbcommon-x11-dev
apt install -y libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf zenity libopenvr-dev:armhf wget git  mesa-utils:arm64 xz-utils pulseaudio vk* vulkan-tools libarchive-dev libarchive-dev:armhf
apt install -y nano cabextract libfreetype6 libfreetype6:armhf libfontconfig libfontconfig:armhf libxext6 libxext6:armhf libxinerama-dev libxinerama-dev:armhf libxxf86vm1 libxxf86vm1:armhf libxrender1 libxrender1:armhf libxcomposite1 libxcomposite1:armhf libxrandr2 libxrandr2:armhf libxi6 libxi6:armhf libxcursor1 libxcursor1:armhf libvulkan-dev libvulkan-dev:armhf libgl1-mesa-dri:armhf libgl1-mesa-dev:armhf libgl1-mesa-dev:armhf libc6:armhf gpg libasound-dev:armhf systemd:armhf libpulse-dev:armhf libgnutls*:arm64 libgnutls*:armhf zenity libopenvr-dev:armhf wget git  mesa-utils xz-utils pulseaudio libcups2:armhf libcairo2:armhf libclang-cpp15:armhf libdatrie1:armhf libdecor-0-0:armhf libdecor-0-plugin-1-cairo:armhf libegl-mesa0:armhf libegl1:armhf libfribidi0:armhf libgbm1:armhf libgl-dev:armhf libgl1:armhf  libgl1-mesa-dri:armhf libglapi-mesa:armhf libgles2:armhf libglvnd0:armhf libglx-dev:armhf libglx-mesa0:armhf libglx0:armhf libgraphite2-3:armhf libharfbuzz0b:armhf libllvmspirvlib15:armhf libpango-1.0-0:armhf libpangocairo-1.0-0:armhf libpangoft2-1.0-0:armhf libpixman-1-0:armhf libsensors5:armhf libthai0:armhf libvdpau1:armhf libxcb-xkb1:armhf libxkbcommon-x11-0:armhf libxkbcommon0:armhf mesa-common-dev:armhf  mesa-opencl-icd:armhf  mesa-utils-bin:armhf mesa-va-drivers:armhf mesa-vdpau-drivers:armhf ocl-icd-libopencl1:armhf  libglx-mesa0:armhf libxcb-dri3-0:armhf libgl1-mesa* libgl1-mesa*:armhf 
apt install -y gcc-13-base:armhf libbsd0:armhf libc6:armhf libdrm-amdgpu1:armhf libdrm2:armhf libedit2:armhf libelf1:armhf libexpat1:armhf libffi8:armhf libgcc-s1:armhf libicu72:armhf libidn2-0:armhf libllvm16:armhf liblzma5:armhf libmd0:armhf libstdc++6:armhf libtinfo6:armhf libunistring5:armhf libvulkan1:armhf libwayland-client0:armhf libx11-6:armhf libx11-xcb1:armhf libxau6:armhf libxcb-dri3-0:armhf libxcb-present0:armhf libxcb-randr0:armhf libxcb-shm0:armhf libxcb-sync1:armhf libxcb-xfixes0:armhf libxcb1:armhf libxdmcp6:armhf libxml2:armhf libxshmfence1:armhf libz3-4:armhf libzstd1:armhf zlib1g:armhf
apt install -y gcc-13-base:arm64 libbsd0:arm64 libc6:arm64 libdrm-amdgpu1:arm64 libdrm2:arm64 libedit2:arm64 libelf1:arm64 libexpat1:arm64 libffi8:arm64 libgcc-s1:arm64 libicu72:arm64 libidn2-0:arm64 libllvm16:arm64 liblzma5:arm64 libmd0:arm64 libstdc++6:arm64 libtinfo6:arm64 libunistring5:arm64 libvulkan1:arm64 libwayland-client0:arm64 libx11-6:arm64 libx11-xcb1:arm64 libxau6:arm64 libxcb-dri3-0:arm64 libxcb-present0:arm64 libxcb-randr0:arm64 libxcb-shm0:arm64 libxcb-sync1:arm64 libxcb-xfixes0:arm64 libxcb1:arm64 libxdmcp6:arm64 libxml2:arm64 libxshmfence1:arm64 libz3-4:arm64 libzstd1:arm64 zlib1g:arm64
clear
# Clone Box86 repository
wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list 
wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg 
apt update
apt install box86-android:armhf 
clear
# Clone Box64 repository
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list 
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg 
apt update 
apt install box64-android -y 
 clear
echo "Box64 installation completed."
# Download and install Wine Proton
wget https://github.com/Kron4ek/Wine-Builds/releases/download/proton-8.0-3/wine-proton-8.0-3-amd64.tar.xz 
tar -xvf wine-proton-8.0-3-amd64.tar.xz -C /opt  > /dev/null 2>&1
echo "Removing unpacked archive..."
mv /opt/wine-proton-8.0-3-amd64 /opt/wine
rm /root/wine-proton-8.0-3-amd64.tar.xz
clear
# Download and install 
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/box64_bash > /dev/null 2>&1
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/box86_bash > /dev/null 2>&1
chmod +x /root/box*_bash && mv /root/box*_bash /opt
clear
# Download VulkanDriveBox.tar.xz
wget https://github.com/eirkkk/Droidbox/releases/download/Eirkkk/VulkanDriveBox.tar.xz 
# Copy the downloaded file to /opt
tar -xvf VulkanDriveBox.tar.xz -C /opt > /dev/null 2>&1
# Extract the contents of 
rm -rf /root/VulkanDriveBox.tar.xz
clear
# Navigate to the 'box' directory
cd /opt/box
# Make all files executable
chmod +x *
# Copy the 'box' directory to /usr/local/bin
mv box /usr/local/bin
# Clean up by removing the downloaded file
apt remove mesa-vulkan-drivers:armhf -y 
apt remove mesa-vulkan-drivers:arm64 -y 
apt install lua5.4 -y
apt install lua5.4:armhf  -y
cd ~/
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks 
chmod +x winetricks
mv winetricks /usr/local/bin/
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/mesa-vulkan-kgsl_23.2.1-20231004_arm64.deb 
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/mesa-vulkan-kgsl_23.2.1-20231004_armhf.deb 
dpkg -i mesa-vulkan-kgsl*arm64.deb  
dpkg -i mesa-vulkan-kgsl*armhf.deb 
rm mesa-vulkan-kgsl*.deb 
clear
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
echo 'export XDG_RUNTIME_DIR=/tmp' >> ~/.bashrc
echo 'export mesa_glthread=true' >> ~/.bashrc
source ~/.bashrc
apt install -y zlib1g-dev:armhf libexpat1-dev:armhf libdrm-dev:armhf libx11-dev:armhf libx11-xcb-dev:armhf libxext-dev:armhf libxdamage-dev:armhf libxcb-glx0-dev:armhf libxcb-dri2-0-dev:armhf libxcb-dri3-dev:armhf libxcb-shm0-dev:armhf libxcb-present-dev:armhf libxshmfence-dev:armhf libxxf86vm-dev:armhf libxrandr-dev:armhf libwayland-dev:armhf wayland-protocols:armhf libwayland-egl-backend-dev:armhf pkg-config:armhf libedit2:armhf libelf1:armhf libicu-dev:armhf libllvm15:armhf liblzma5:armhf libstdc++6:armhf libtinfo6:armhf libvulkan1:armhf libxml2:armhf libzstd1:armhf '^libxcb.*-dev':armhf libx11-xcb-dev:armhf libglu1-mesa-dev:armhf libxrender-dev:armhf libxi-dev:armhf libxkbcommon-dev:armhf libxkbcommon-x11-dev:armhf
clear
echo "Installation completed."
