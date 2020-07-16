bash nyzo.sh &&

bash -c 'echo "wdcliuerlin-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

supervisorctl reload &&

cd /root/nknx &&
bash install.sh &&

cd /root &&

rm -rf nknx &&

sleep 5s &&

curl http://members.3322.org/dyndns/getip >> /root/temp &&

sleep 5s &&

echo "`cat /root/temp`:9444:`cat /var/lib/nyzo/production/verifier_private_seed`" >> /nyzo/nyzo &&

sleep 15s &&

echo "`cat /root/temp`," >> /nyzo/nkn &&

sleep 15s &&

reboot
