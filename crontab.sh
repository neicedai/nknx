crontab -l > tempcron &&
echo "13 10,16,22,4 * * * /home/nknx/nknupdate >/dev/null 2>&1" >> tempcron &&
echo "0 0 * * 0 cd /home/ubuntu/nyzoVerifier && sudo git reset --hard && sudo git pull origin master && sudo ./gradlew build && sudo supervisorctl reload" >> tempcron &&
echo "@reboot sudo supervisorctl reload" >> tempcron &&
crontab tempcron > /dev/null 2>&1 &&
rm tempcron > /dev/null 2>&1
