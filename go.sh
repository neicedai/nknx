sudo bash nyzo.sh &&
wget -O install.sh 'https://api.nknx.org/deployment/install/40f4a436-6fe1-48ee-b79d-5fc208d1de13' &&
sudo bash install.sh &&
cd /home/nknx/go/src/github.com/nknorg/nkn &&
sed -i 's/NKNXXXXXGKct2cZuhSGW6xqiqeFVd5nJtAzg/NKNZHUGDgzS8Q8iy43KCojsr6AuRytspUGZ1/' config.json &&
cd /home/nknx/ &&
rm donationcheck
