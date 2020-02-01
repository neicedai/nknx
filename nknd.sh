wget -O install.sh 'https://api.nknx.org/deployment/install/c27916c2-7199-4945-bfb3-4c4968f6cfe1' &&
sudo bash install.sh &&
sleep 20s &&
cd /home/nknx/go/src/github.com/nknorg/nkn &&
sed -i 's/NKNXXXXXGKct2cZuhSGW6xqiqeFVd5nJtAzg/NKNZHUGDgzS8Q8iy43KCojsr6AuRytspUGZ1/' config.json &&
cd /home/nknx/ &&
rm donationcheck
