#cd /etc/ssh &&
#sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
#service sshd restart &&
#sleep 5s &&
#cd /root/nknx &&
sudo su &&
journalctl --vacuum-time=1d &&
dd if=/dev/zero of=/swapfile bs=1M count=2048 &&
mkswap /swapfile &&
chmod 0600 /swapfile &&
swapon /swapfile &&
echo "/swapfile   swap   swap    defaults 0 0" >>/etc/fstab &&
cp nym-mixnode.service /etc/systemd/system/&&
bash nym.sh
bash install.sh &&
sleep 5s &&
bash nyzo.sh &&
bash -c 'echo "aawdc-$RANDOM-aws" > /var/lib/nyzo/production/nickname' &&
supervisorctl reload &&
cd /root/nknx &&
#cd /etc &&
#rm rc.local &&
#cd /root &&
#cp /root/nknx/reboot.sh /etc/rc.local &&
#chmod 777 /etc/rc.local &&
#cd /root &&
#rm -rf nknx &&
sleep 5s &&
apt-get install nfs-common -y &&
mkdir /nyzo &&
sleep 5s && 
sudo mount -t nfs 67.207.85.130:/nfsnyzo /nyzo -o nolock &&
sleep 20s &&
##curl http://members.3322.org/dyndns/getip >> /root/temp &&
wget -qO- http://ipecho.net/plain >> /root/temp &&
sleep 10s &&
#sleep $[RANDOM%20]s &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /nyzo/nyzodobashisi &&

sleep 15s &&

echo "`cat /root/temp`," >> /nyzo/nkndobashisi &&

sleep 15s 

#echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /root/seed &&

#sleep 5s &&

#echo "`cat /root/temp`," >> /root/nkndo &&

#reboot
