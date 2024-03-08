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

# Ask user for version
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
pkg install proot-distro proot termux-x11-nightly wget git pulseaudio tsu -y  > /dev/null 2>&1

# Setup storage access for Termux
termux-setup-storage

# Download Ubuntu base image
echo "Downloading Rootfs base image..."
wget "https://github.com/debuerreotype/docker-debian-artifacts/blob/dist-arm64v8/trixie/rootfs.tar.xz?raw=true" -O rootfs.tar.xz
clear
# Depending on user choice, download and configure the appropriate version
if [ $version_choice -eq 1 ]; then
    echo "Downloading and configuring Root version..."
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/Droidbox/droidbox  > /dev/null 2>&1
    chmod +x droidbox
    mv droidbox /data/data/com.termux/files/usr/bin/
elif [ $version_choice -eq 2 ]; then
    echo "Downloading and configuring Proot version..."
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/start-droidbox  > /dev/null 2>&1
    wget -q https://raw.githubusercontent.com/eirkkk/Droidbox/main/droidbox  > /dev/null 2>&1
    chmod +x start-droidbox droidbox
    mv start-droidbox droidbox /data/data/com.termux/files/usr/bin/
fi

# Create a directory for Ubuntu
mkdir -p $HOME/.debian
mkdir $HOME/.debian/sdcard

# Extract the Ubuntu base image
echo "Extracting Rootfs..."
proot --link2symlink tar -xf rootfs.tar.xz -C $HOME/.debian > /dev/null 2>&1
echo 'nameserver 1.1.1.1' >> $HOME/.debian/etc/resolv.conf
# Remove the downloaded tar file
rm rootfs.tar.xz

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
