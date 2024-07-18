#!/data/data/com.termux/files/usr/bin/bash

# Set the countdown timer (e.g., 60 seconds)
countdown=60
clear
# Function to display countdown in hh:mm:ss format
function display_countdown() {
    local hours=$((countdown / 3600))
    local minutes=$(( (countdown % 3600) / 60 ))
    local seconds=$((countdown % 60))
    echo -ne "Time remaining: $(printf "%02d:%02d:%02d" $hours $minutes $seconds)\r"
}

# Ask user for versions 
echo "Select version to install:"
echo "1) Root version"
echo "2) Proot version"
read -p "Enter choice (1 or 2): " version_choice

# Validate user input
if [[ $version_choice -ne 1 ]] && [[ $version_choice -ne 2 ]]; then
    echo "Invalid choice. Exiting."
    exit 1
fi

# Start the main process
echo "Updating package list..."
pkg update -y && echo "Update completed."

# Clear the screen
clear

echo "Installing required packages..."
pkg install x11-repo -y  > /dev/null 2>&1
pkg install proot-distro proot termux-x11-nightly wget git pulseaudio debootstrap tsu -y  > /dev/null 2>&1

# Setup storage access for Termux
termux-setup-storage

# Download Ubuntu base image
echo "Downloading Rootfs base image..."
clear
# Depending on user choice, download and configure the appropriate version
if [ $version_choice -eq 1 ]; then
    echo "Downloading and configuring Root version..."
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/Droidbox/droidbox  > /dev/null 2>&1
    chmod +x droidbox
    mv droidbox /data/data/com.termux/files/usr/bin/
   sudo  mkdir -p /data/local/.droidbox
   wget -q https://cdimage.ubuntu.com/ubuntu-base/daily/current/oracular-base-arm64.tar.gz > /dev/null 2>&1
   sudo tar -xf oracular-base-arm64.tar.gz -C /data/local/.droidbox
   rm -rf oracular-base-arm64.tar.gz
   sudo mkdir -p /data/local/.droidbox/system
   sudo mkdir -p /data/local/.droidbox/data
   sudo mkdir -p /data/local/.droidbox/sdcard
   su -c echo " "nameserver 8.8.8.8" > /data/local/.droidbox/etc/resolv.conf"
   su -c echo  " 'APT::Sandbox::User "root";' > /data/local/.droidbox/etc/apt/apt.conf.d/01-android-nosandbox"
   su -c echo  " "127.0.0.1 localhost" > /data/local/.droidbox/etc/hosts"
   su -c chroot  /data/local/.droidbox /bin/su -c "groupadd -g 3003 aid_inet 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "groupadd -g 3004 aid_net_raw 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "groupadd -g 1003 aid_graphics 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "usermod -g 3003 -G 3003,3004 -a _apt 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "usermod -G 3003 -a root 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime 2>/dev/null"
   su -c chroot  /data/local/.droidbox /bin/su -c "locale-gen en_US.UTF-8 2>/dev/null"
   
   
elif [ $version_choice -eq 2 ]; then
    echo "Downloading and configurg Proot version..."
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/start-droidbox  > /dev/null 2>&1
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/droidbox  > /dev/null 2>&1
    chmod +x start-droidbox droidbox
    wget https://github.com/eirkkk/Droidbox/releases/download/Eirkkk/rootfs.tar.xz > /dev/null 2>&1
    mv start-droidbox droidbox /data/data/com.termux/files/usr/bin/
    proot --link2symlink tar -xf rootfs.tar.xz -C $HOME/.debian > /dev/null 2>&1
    rm rootfs.tar.xz
fi
# Remove the downloaded tar file


# Countdown timer synchronized with execution
while [ $countdown -gt 0 ]; do
    display_countdown
    sleep 1
    ((countdown--))
done

# Clear the countdown message
echo -ne "\r\033[K"

# Completion message
echo "Execution completed successfully!"
