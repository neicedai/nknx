sudo bash nyzo.sh &&
wget -O install.sh 'https://api.nknx.org/deployment/install/05535d96-9e70-4174-aa36-a5567eb1717e' &&
sudo bash install.sh &&
sleep 20s &&
cd /home/nknx/go/src/github.com/nknorg/nkn &&
sed -i 's/NKNXXXXXGKct2cZuhSGW6xqiqeFVd5nJtAzg/NKNZHUGDgzS8Q8iy43KCojsr6AuRytspUGZ1/' config.json &&
cd /home/nknx/ &&
rm donationcheck
