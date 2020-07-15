bash nyzo.sh &&

bash -c 'echo "wdcT-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

supervisorctl reload &&
cd /etc/ssh &&
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
service sshd restart &&
cd /root/nknx &&
bash install.sh &&

cd /etc &&

rm rc.local &&

cd /root &&

rm -rf nknx &&

echo "`curl http://members.3322.org/dyndns/getip`," >> /nyzo/nkn &&
sleep 5s &&
curl http://members.3322.org/dyndns/getip >> /root/temp &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /nyzo/nyzo.txt &&

sleep 15s &&

reboot
