bash nyzo.sh &&

bash -c 'echo "wdc3-$RANDOM-do" > /var/lib/nyzo/production/nickname' &&

supervisorctl reload &&

bash install.sh &&

cd /home &&

mkdir burst &&

cd burst &&

wget https://github.com/burst-apps-team/burstcoin/releases/download/v2.5.1/burstcoin-2.5.1.zip &&

unzip burstcoin-2.5.1.zip &&

rm -rf burstcoin-2.5.1.zip &&

rm -rf burst.exe &&

java -jar burst.jar -h
