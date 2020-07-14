//bash nyzo.sh &&

//bash -c 'echo "wdcT-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

//supervisorctl reload &&

bash install.sh &&

cd /etc &&

rm rc.local &&

cd /root &&

rm -rf nknx
