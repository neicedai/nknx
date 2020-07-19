rm /etc/rc.local &&

sudo iscsiadm --mode node --targetname nyzo --portal 64.227.99.95:3260 --login &&

sleep 20s &&

mount /dev/sda /nyzo &&

sleep 20s &&

cat temp >> /nyzo/1.txt &&

sleep 10s &&

cat seed >> /nyzo/2.txt &&

reboot
