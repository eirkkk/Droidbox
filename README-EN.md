
1. Start the Termux application and enter the following command, then press "Enter":
   ```bash
   curl -o install https://raw.githubusercontent.com/eirkkk/Droidbox/main/setup.sh && chmod +x setup.sh && ./setup.sh
   ```

2. After completing the Debian installation, run the following command to start Droidbox:
   ```bash
   droidbox --start
   ```

3. To install box64, box86, and their dependencies without taking up too much space on your device, use the following command:
   ```bash
   apt update && apt install wget && wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/box.sh && bash box.sh && rm box.sh
   ```

4. This step is for installing the graphics display application on your Android device:
   ```bash
   https://raw.githubusercontent.com/eirkkk/Droidbox/main/app-arm64-v8a-debug.apk
   ```

5. After installing the app on your phone, return to the Termux application and enter the following command:
   ```bash
   droidbox --start
   ```
   Then, after opening the interface, enter this command:
   ```bash
   box
   ```
   After entering the "box" command, you'll see three options. Choose option number 2 to complete the emulator setup.

6. If you want to create your own custom drivers, use this command:
   ```bash
   cd /root
   apt update
   apt install wget
   wget https://raw.githubusercontent.com/eirkkk/Droidbox/main/build_deb_mesa.sh
   bash build_deb_mesa.sh
   ```

7. After the installation is complete, you will have two packages in the Desktop folder. Enter the Desktop folder to install the drivers:
   ```bash
   cd /root/Desktop
   dpkg -i mesa-vulkan-kgsl*armhf.deb
   dpkg -i mesa-vulkan-kgsl*arm64.deb
   ```

These are the ordered steps to install Mesa drivers and the graphics display application on your Android phone using Termux. Please note that this involves using the Wine emulator and technologies like Box86 and Box64 to run Windows applications on Android. It requires some command-line expertise and familiarity with the Android system to successfully follow these steps. Be aware that running Windows applications on this emulator may come with challenges and limitations.
