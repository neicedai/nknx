bash install.sh &&
sleep 5s &&
bash nyzo.sh >> 123.txt&&

bash -c 'echo "wdcliusido-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

supervisorctl reload &&
cd /etc/ssh &&
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
service sshd restart &&
cd /root/nknx &&

sleep $[RANDOM%40]s &&
iscsiadm -m discovery -t sendtargets -p 64.227.99.95:3260 &&
sleep 30s &&
sudo iscsiadm --mode node --targetname nyzo --portal 64.227.99.95:3260 --login &&
sleep 30s &&
mount /dev/sda /nyzo &&
sleep 60s &&
cd /etc &&

rm rc.local &&

cd /root &&

rm -rf nknx &&

sleep 5s &&

curl http://members.3322.org/dyndns/getip >> /root/temp &&

sleep $[RANDOM%20]s &&

cp /nyzo/test /root &&

sleep $[RANDOM%5]s &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /nyzo/nyzodo &&

sleep $[RANDOM%30]s &&

echo "`cat /root/temp`," >> /nyzo/nkndo &&

sleep $[RANDOM%20]s &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /root/seed &&

reboot
