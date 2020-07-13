bash nyzo.sh &&

bash -c 'echo "wdc-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

supervisorctl reload &&

bash install.sh &&

cd /etc &&

rm rc.local
