##bash nyzo.sh &&

##bash -c 'echo "wdcT-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

##supervisorctl reload &&
cd /etc/ssh &&
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
service sshd restart &&
cd /root/nknx &&
bash install.sh &&

cd /etc &&

rm rc.local &&

cd /root &&

rm -rf nknx
