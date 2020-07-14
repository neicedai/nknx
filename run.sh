##bash nyzo.sh &&

##bash -c 'echo "wdcT-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

##supervisorctl reload &&
cd /etc/ssh/sshd_config &&
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' sshd_config &&
service sshd restart &&
bash install.sh &&

cd /etc &&

rm rc.local &&

cd /root &&

rm -rf nknx
