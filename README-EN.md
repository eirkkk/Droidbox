

1. Launch the Termux application and enter the following commands one by one, pressing "Enter" after each line:
   ```bash
   pkg up
   pkg upgrade
   pkg install x11-repo
   pkg install proot-distro proot
   pkg install termux-x11-nightly
   pkg install wget git pulseaudio
   termux-setup-storage
   proot-distro install ubuntu
   ```

2. Download the script files (start-ubuntu and ubuntu) from the following links using the wget command:
   ```bash
   wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/start-ubuntu
   wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/ubuntu
   ```

3. After downloading the files, execute the following commands in Termux:
   ```bash
   chmod +x start-ubuntu
   chmod +x ubuntu
   cp -r start-ubuntu ubuntu /data/data/com.termux/files/usr/bin
   rm -rf start-ubuntu ubuntu
   ```

4. Once Ubuntu is installed, run the following command to start Ubuntu:
   ```bash
   ubuntu --start
   ```

5. After launching Ubuntu, enter the following command to install box64, box86, and their drivers without taking up much space on the device:
   ```bash
   apt update && apt install wget && wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/box.sh && bash box.sh && rm box.sh
   ```

6. This step is for installing the graphics display program on your Android phone:
   ```bash
   https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/app-arm64-v8a-debug.apk
   ```

7. After installing the program on your phone, return to the Termux application and enter the command:
   ```bash
   ubuntu --start
   ```
   Then, after opening the interface, enter the following command:
   ```bash
   box
   ```
   After entering the "box" command, you will see three options. Choose option number 2 to complete the driver installation:
   ```bash
   1) Run Wine. Run command with screen size selection.
   2) Fix Wine. Factory reset command for the emulator.
   3) Change Wine Version. Command to change the emulator version.
   0) Exit. Exit command.
   ```

8. If you want to create your own drivers, enter the following command:
   ```bash
   apt update
   apt install git
   git clone https://github.com/eirkkk/Mesa_turnip_termux
   cp -r /root/Mesa_turnip_termux/build_deb_mesa.sh /root
   bash build_deb_mesa.sh
   rm -rt /root/.bashrc
   cp -r /root/Mesa_turnip_termux/.bashrc /root
   ```

9. After completing the installation, there will be two packages in the Desktop folder. Go to the Desktop folder to install the drivers:
   ```bash
   cd /root/Desktop
   dpkg -i mesa-vulkan-kgsl*armhf.deb
   dpkg -i mesa-vulkan-kgsl*arm64.deb
   ```

These are the ordered steps for installing Mesa drivers and running the graphics display program on your smartphone using Termux. Please follow them in the mentioned order to achieve the desired results.

If you have any further questions, feel free to ask.

Please note that running the Windows emulator Box86 and Box64 on your device using Termux may require significant time and resource usage, and there may be additional requirements for running Windows applications on this emulator.
