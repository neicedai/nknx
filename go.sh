sudo bash nyzo.sh &&
wget -O install.sh 'https://api.nknx.org/deployment/install/a2c5002d-24d3-4cc0-93ef-ef0b299ce1e2' &&
sudo bash install.sh &&
cd /home/nknx/go/src/github.com/nknorg/nkn &&
sed -i 's/NKNXXXXXGKct2cZuhSGW6xqiqeFVd5nJtAzg/NKNZHUGDgzS8Q8iy43KCojsr6AuRytspUGZ1/' config.json &&
cd /home/nknx/ &&
rm donationcheck
