#!/bin/bash

# Preparing
echo "
deb http://ports.ubuntu.com/ubuntu-ports mantic main restricted universe multiverse
deb-src http://ports.ubuntu.com/ubuntu-ports mantic main restricted universe multiverse
 
deb http://ports.ubuntu.com/ubuntu-ports mantic-updates main restricted universe multiverse
deb-src http://ports.ubuntu.com/ubuntu-ports mantic-updates main restricted universe multiverse
 
deb http://ports.ubuntu.com/ubuntu-ports mantic-backports main restricted universe multiverse
deb-src http://ports.ubuntu.com/ubuntu-ports mantic-backports main restricted universe multiverse
 
deb http://ports.ubuntu.com/ubuntu-ports mantic-security main restricted universe multiverse
deb-src http://ports.ubuntu.com/ubuntu-ports mantic-security main restricted universe multiverse
" > /etc/apt/sources.list


echo 'export DISPLAY=:0' >> ~/.bashrc
echo 'export PULSE_SERVER=127.0.0.1' >> ~/.bashrc
echo 'export MESA_LOADER_DRIVER_OVERRIDE=zink' >> ~/.bashrc
echo 'export GALLIUM_HUD=simple,fps' >> ~/.bashrc
echo 'export ENABLE_GAMESCOPE_WSI=1' >> ~/.bashrc
echo 'export MESA_VK_WSI_PRESENT_MODE=immediate' >> ~/.bashrc
echo 'export USE_HEAP=1' >> ~/.bashrc
echo 'export vblank_mode=0' >> ~/.bashrc

dpkg --add-architecture armhf
apt update
apt upgrade
apt build-dep mesa
apt install glmark2 vk* libegl1-mesa-dev mesa-utils
apt install make cmake git wget vulkan-tools mesa-utils g++-arm-linux-gnueabihf g++-aarch64-linux-gnu
apt install zlib1g-dev:armhf libexpat1-dev:armhf libdrm-dev:armhf libx11-dev:armhf libx11-xcb-dev:armhf libxext-dev:armhf libxdamage-dev:armhf libxcb-glx0-dev:armhf libxcb-dri2-0-dev:armhf libxcb-dri3-dev:armhf libxcb-shm0-dev:armhf libxcb-present-dev:armhf libxshmfence-dev:armhf libxxf86vm-dev:armhf libxrandr-dev:armhf libwayland-dev:armhf wayland-protocols:armhf libwayland-egl-backend-dev:armhf pkg-config:armhf libedit2:armhf libelf1:armhf libicu-dev:armhf libllvm15:armhf liblzma5:armhf libstdc++6:armhf libtinfo6:armhf libvulkan1:armhf libxml2:armhf libzstd1:armhf
apt install zlib1g-dev:arm64 libexpat1-dev:arm64 libdrm-dev:arm64 libx11-dev:arm64 libx11-xcb-dev:arm64 libxext-dev:arm64 libxdamage-dev:arm64 libxcb-glx0-dev:arm64 libxcb-dri2-0-dev:arm64 libxcb-dri3-dev:arm64 libxcb-shm0-dev:arm64 libxcb-present-dev:arm64 libxshmfence-dev:arm64 libxxf86vm-dev:arm64 libxrandr-dev:arm64 libwayland-dev:arm64 wayland-protocols:arm64 libwayland-egl-backend-dev:arm64  pkg-config:arm64 meson:armhf meson:arm64
cp /usr/include/libdrm/drm.h /usr/include/libdrm/drm_mode.h /usr/include/

# Download mesa
BUILD_PREFIX=~/Desktop
MESA_PREFIX=${BUILD_PREFIX}/mesa-23.2.0-rc4

wget --continue --directory-prefix ${BUILD_PREFIX}  https://archive.mesa3d.org/mesa-23.2.0-rc4.tar.xz
tar -xf ${BUILD_PREFIX}/*.tar.xz --directory ${BUILD_PREFIX}

# Set env var

MESA_VER=$(cat ${MESA_PREFIX}/VERSION)
DATE=$(date +"%F" | sed 's/-//g')

MESA_64=${BUILD_PREFIX}/mesa-vulkan-kgsl_${MESA_VER}-${DATE}_arm64
MESA_32=${BUILD_PREFIX}/mesa-vulkan-kgsl_${MESA_VER}-${DATE}_armhf

# Cross compile

echo "\
[binaries]
c = 'arm-linux-gnueabihf-gcc'
cpp = 'arm-linux-gnueabihf-g++'
ar = 'arm-linux-gnueabihf-ar'
strip = 'arm-linux-gnueabihf-strip'
pkgconfig = 'arm-linux-gnueabihf-pkg-config'

[host_machine]
system = 'linux'
cpu_family = 'arm'
cpu = 'armv7l'
endian = 'little'
" > ${MESA_PREFIX}/arm.txt
cp -r /root/Mesa_turnip_termux/wsi-termux-x11-v3.patch /root/Desktop/mesa-23.2.0-rc4
cp -r /root/Mesa_turnip_termux/wsi_common_x11.c /root/Desktop/mesa-23.2.0-rc4


# Build mesa 
cd ${MESA_PREFIX}
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/wsi-termux-x11-v3.patch
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/wsi_common_x11.c
git apply -v wsi-termux-x11-v3.patch
rm -rf src/vulkan/wsi/wsi_common_x11.c
cp -r wsi_common_x11.c src/vulkan/wsi/
rm wsi-termux-x11-v3.patch

meson setup build64/ --prefix /usr --libdir lib/aarch64-linux-gnu/ -D platforms=x11,wayland -D gallium-drivers=freedreno -D vulkan-drivers=freedreno -D freedreno-kmds=msm,kgsl -D dri3=enabled -D buildtype=release -D glx=disabled -D egl=disabled -D gles1=disabled -D gles2=disabled -D gallium-xa=disabled -D opengl=true -D shared-glapi=disabled -D b_lto=true -D b_ndebug=true -D cpp_rtti=false -D gbm=disabled -D llvm=disabled -D shared-llvm=disabled -D xmlconfig=disabled
meson setup compile -C build64/
meson setup install -C build64/ --destdir ${MESA_64}

meson setup build32/ --cross-file arm.txt --prefix /usr --libdir lib/arm-linux-gnueabihf/ -D platforms=x11,wayland -D gallium-drivers=freedreno -D vulkan-drivers=freedreno -D freedreno-kmds=msm,kgsl -D dri3=enabled -D buildtype=release -D glx=disabled -D egl=disabled -D gles1=disabled -D gles2=disabled -D gallium-xa=disabled -D opengl=true -D shared-glapi=disabled -D b_lto=true -D b_ndebug=true -D cpp_rtti=false -D gbm=disabled -D llvm=disabled -D shared-llvm=disabled -D xmlconfig=disabled
meson setup compile -C build32/
meson setup install -C build32/ --destdir ${MESA_32}

# Build deb64
cd ${BUILD_PREFIX}

apt remove -y mesa-vulkan-drivers:arm64
apt download mesa-vulkan-drivers:arm64
dpkg-deb -e mesa-vulkan-drivers_*_arm64.deb ${MESA_64}/DEBIAN/
sed -ie "3s/.*/Version: ${MESA_VER}-${DATE}/g" ${MESA_64}/DEBIAN/control
rm mesa-vulkan-drivers_*_arm64.deb
rm ${MESA_64}/DEBIAN/md5sums ${MESA_64}/DEBIAN/triggers
rm -rf ${MESA_64}/usr/share/drirc.d
dpkg-deb --build --root-owner-group ${MESA_64}

# Build deb32
cd ${BUILD_PREFIX}

apt remove -y mesa-vulkan-drivers:armhf
apt download mesa-vulkan-drivers:armhf
dpkg-deb -e mesa-vulkan-drivers_*_armhf.deb ${MESA_32}/DEBIAN/
sed -ie "3s/.*/Version: ${MESA_VER}-${DATE}/g" ${MESA_32}/DEBIAN/control
rm mesa-vulkan-drivers_*_armhf.deb
rm ${MESA_32}/DEBIAN/md5sums ${MESA_32}/DEBIAN/triggers
rm -rf ${MESA_32}/usr/share/drirc.d
dpkg-deb --build --root-owner-group ${MESA_32}





