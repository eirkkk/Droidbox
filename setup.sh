#!/data/data/com.termux/files/usr/bin/bash

# Set the countdown timer (e.g., 60 seconds)
countdown=60

# Function to display countdown in hh:mm:ss format
function display_countdown() {
    local hours=$((countdown / 3600))
    local minutes=$(( (countdown % 3600) / 60 ))
    local seconds=$((countdown % 60))
    echo -ne "Time remaining: $hours:$minutes:$seconds\r"
}

# Start time
start_time=$(date +%s)

# Display a waiting message
echo "Executing... Please wait."

# Execute the commands
pkg up -y 
pkg upgrade -y 
clear
pkg install x11-repo -y > /dev/null 2>&1
pkg install proot-distro proot termux-x11-nightly wget git pulseaudio -y > /dev/null 2>&1
termux-setup-storage > /dev/null 2>&1
proot-distro install ubuntu > /dev/null 2>&1
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/start-ubuntu > /dev/null 2>&1
wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/ubuntu > /dev/null 2>&1
chmod +x start-ubuntu && chmod +x ubuntu > /dev/null 2>&1
cp -r start-ubuntu ubuntu /data/data/com.termux/files/usr/bin > /dev/null 2>&1
rm -rf start-ubuntu ubuntu > /dev/null 2>&1

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
