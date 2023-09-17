

1. قم بتشغيل تطبيق Termux وادخل الأوامر التالية واحدة تلو الأخرى واضغط على "Enter" بعد كل سطر:
```bash
pkg up
pkg upgrade
pkg install x11-repo
pkg install proot-distro proot
pkg install termux-x11-nightly
pkg install wget git
proot-distro install ubuntu
```

2. قم بتنزيل ملفي البرنامج النصي (start-ubuntu و ubuntu) من الروابط التالية باستخدام الأمر wget:
```bash
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/start-ubuntu
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/ubuntu
```

3. بعد تنزيل الملفين، قم بتنفيذ الأوامر التالية في Termux:
```bash
chmod +x start-ubuntu
chmod +x ubuntu
cp -r start-ubuntu ubuntu /data/data/com.termux/files/usr/bin
rm -rf start-ubuntu ubuntu
```

4. بعد الانتهاء من تثبيت Ubuntu، قم بتشغيل الأمر التالي لبدء Ubuntu:
```bash
ubuntu --start
```

5. بعد تشغيل Ubuntu، قم بإدخال الأوامر التالية واحدة تلو الأخرى واضغط على "Enter" بعد كل سطر:
```bash
git clone https://github.com/eirkkk/Mesa_turnip_termux
cp -r /root/Mesa_turnip_termux/build_deb_mesa.sh /root
bash build_deb_mesa.sh
rm -rt /root/.bashrc
cp -r /root/Mesa_turnip_termux/.bashrc /root
```
 
6. بعد الأ نتهاء من التثبيت ستكون هناك حزمتين في مجلد Desktop قم بدخول الى مجلد Desktop لتثبيت التعريفات:
```bash 
cd /root/Desktop
dpkg -i mesa-vulkan-kgsl_23.3.0-devel-*_armhf.deb
dpkg -i mesa-vulkan-kgsl_23.3.0-devel-*_arm64.deb
```

7. هاذي الخطوة لتثبيت برنامج عرض الرسوميات على هاتفك الاندرويد:
```bash
https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/app-arm64-v8a-debug.apk
```

```

هذه هي الخطوات المرتبة لتثبيت تعريفات Mesa وتثبيت برنامج عرض الروسميات على هاتفك الذكي باستخدام Termux. يجب عليك اتباعها بالترتيب المذكور للحصول على النتائج المطلوبة.

إذا كان لديك أي أسئلة أخرى، فلا تتردد في طرحها.
