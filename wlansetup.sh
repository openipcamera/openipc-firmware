echo "$(date) - $0:  WlanSetup via SD-Card - modified" >> /tmp/hacks.log 2>&1
cp /media/mmcblk0p1/.wifissid /etc/config/.wifissid
cp /media/mmcblk0p1/.wifipasswd /etc/config/.wifipasswd