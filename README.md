

1. قم بتشغيل تطبيق Termux وادخل الأوامر التالية واحدة تلو الأخرى واضغط على "Enter" بعد كل سطر:
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
5.بعد تشغل ubuntu ضع الرابط لتثبيت box64 box86 مع التعريفات بدون اخذ الكثير من مساحة الجهاز
```bash
wget https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/box.sh && bash box.sh && rm box.sh
```

6. هاذي الخطوة لتثبيت برنامج عرض الرسوميات على هاتفك الاندرويد:
```bash
https://raw.githubusercontent.com/eirkkk/Mesa_turnip_termux/main/app-arm64-v8a-debug.apk
```

7.بعد الانتهاء من تثبيت البرنامج على الهاتف عد الى تطبيق Termux ادخل الامر  :
```bash
ubuntu --start
```
.ثم بعد فتح الواجه ادخل هاذا الامر :

```bash
box 
````
بعد ادخال الامر box ستظهر لك ثلاث خيارات :
```bash
1) Run Wine. امر التشغيل مع اختيار مقاس الشاشه
2) Fix Wine.  امر ضبط المصنع للمحاكي 
3) Change Wine Version.  امر تغير اصدار المحاكي
0) Exit.  امر الخروج
   ````


8. اذا كنت ترغب بصناعه تعريفات خاصه بك ادخل هاذا الامر :
```bash
apt update
apt install git
git clone https://github.com/eirkkk/Mesa_turnip_termux
cp -r /root/Mesa_turnip_termux/build_deb_mesa.sh /root
bash build_deb_mesa.sh
rm -rt /root/.bashrc
cp -r /root/Mesa_turnip_termux/.bashrc /root
```
 
9. بعد الأ نتهاء من التثبيت ستكون هناك حزمتين في مجلد Desktop قم بدخول الى مجلد Desktop لتثبيت التعريفات:
```bash 
cd /root/Desktop
dpkg -i mesa-vulkan-kgsl*armhf.deb
dpkg -i mesa-vulkan-kgsl*arm64.deb
```

هذه هي الخطوات المرتبة لتثبيت تعريفات Mesa وتثبيت برنامج عرض الروسميات على هاتفك الذكي باستخدام Termux. يجب عليك اتباعها بالترتيب المذكور للحصول على النتائج المطلوبة.

إذا كان لديك أي أسئلة أخرى، فلا تتردد في طرحها.

بعد ذلك، يجب أن يتم تشغيل سطح المكتب لمحاكي ويندوز Box86 و Box64 على جهازك الذي يعمل بنظام Termux. يُرجى ملاحظة أن هذه الإجراءات قد تتطلب وقتًا واستخدامًا مكثفًا للموارد، وقد يكون هناك متطلبات إضافية لتشغيل تطبيقات ويندوز على هذا المحاكي.
