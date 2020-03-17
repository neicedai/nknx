clear
echo "============================================================================================="
echo "                              WELCOME TO NKNx FAST DEPLOY!"
echo "============================================================================================="
echo
echo "This script will automatically provision a node as you configured it in your snippet."
echo "So grab a coffee, lean back or do something else - installation will take about 5-15 minutes."
echo -e "============================================================================================="
echo
echo "Updating your OS..."
echo "---------------------------"
export DEBIAN_FRONTEND=noninteractive
apt-get -qq update > /dev/null 2>&1
apt-get -qq upgrade -y > /dev/null 2>&1
apt-get install make curl git unzip whois -y --allow-downgrades --allow-remove-essential --allow-change-held-packages > /dev/null 2>&1
apt-get install make curl git ufw unzip whois -y --allow-downgrades --allow-remove-essential --allow-change-held-packages > /dev/null 2>&1
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - > /dev/null 2>&1
apt-get install nodejs -y --allow-downgrades --allow-remove-essential --allow-change-held-packages > /dev/null 2>&1
npm install --global yarn > /dev/null 2>&1
echo "Installed additional node.js and yarn packages for WebUI"
echo -e "=> Updating complete
"
## Install Go
echo "Installing go..."
echo "---------------------------"
GOURLREGEX='https://dl.google.com/go/go[0-9\.]+\.linux-amd64.tar.gz'
url="$(wget -qO- https://golang.org/dl/ | grep -oP 'https:\/\/dl\.google\.com\/go\/go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1)"
latest="$(echo $url | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2)"
wget --quiet --continue --show-progress "${url}" > /dev/null 2>&1
unset url
unset GOURLREGEX
echo "Downloading go"
sudo rm -rf /usr/local/go > /dev/null 2>&1
sudo tar -C /usr/local -xzf go"${latest}".linux-amd64.tar.gz > /dev/null 2>&1
echo "Setting up GOPATH"
echo "export GOPATH=~/go" >>~/.profile && source ~/.profile
echo "Setting PATH to include golang binaries"
echo "export PATH='$PATH':/usr/local/go/bin:$GOPATH/bin" >>~/.profile && source ~/.profile
if [ -d /usr/local/go ]; then
echo -e "=> Go installed successfully
"
rm go"${latest}".linux-amd64.tar.gz > /dev/null 2>&1
else
echo "Installation failed"
exit 1
fi
# Setup nknx User
echo "Setting up NKN user..."
echo "---------------------------"
useradd nknx > /dev/null 2>&1
mkdir -p /home/nknx/.ssh > /dev/null 2>&1
mkdir -p /home/nknx/.nknx > /dev/null 2>&1
adduser nknx sudo > /dev/null 2>&1
# Setup Bash For nknx User
chsh -s /bin/bash nknx > /dev/null 2>&1
cp /root/.profile /home/nknx/.profile > /dev/null 2>&1
cp /root/.bashrc /home/nknx/.bashrc > /dev/null 2>&1
# Set The Sudo Password For nknx
PASSWORD=$(mkpasswd A68dx75f8)
usermod --password $PASSWORD nknx > /dev/null 2>&1
chown -R nknx:nknx /home/nknx > /dev/null 2>&1
chmod -R 755 /home/nknx > /dev/null 2>&1
echo -e "=> User successfully created
"
## Install NKN
echo "Installing NKN..."
echo "----------------------------"
mkdir -p "/home/nknx/go/src/github.com/nknorg"  > /dev/null 2>&1
cd "/home/nknx/go/src/github.com/nknorg"  > /dev/null 2>&1
echo "Cloning NKN repository"
git clone https://github.com/nknorg/nkn.git > /dev/null 2>&1
cd nkn > /dev/null 2>&1
echo "Building NKN node software"
make >/dev/null 2>&1
if [ -f "/home/nknx/go/src/github.com/nknorg/nkn/nknd" ]; then
echo -e "=> NKN Node software installed successfully
"
else
echo "Installation failed"
exit 1
fi
## Set the miner
echo "Setting up NKNx Fast Deploy..."
echo "------------------------"
# In case NKN install is skipped
cd "/home/nknx/go/src/github.com/nknorg/nkn" > /dev/null 2>&1
echo "Downloading pruned chain file (This can take a long time)"
wget --quiet --continue --show-progress "https://nkn.org/ChainDB_pruned_latest.zip"
echo "Extracting chain file (This can also take a long time)"
unzip ChainDB_pruned_latest.zip > /dev/null 2>&1
rm ChainDB_pruned_latest.zip > /dev/null 2>&1
# Config
echo "Writing config data"
cat >config.json <<EOF
{
    "BeneficiaryAddr": "NKNZHUGDgzS8Q8iy43KCojsr6AuRytspUGZ1",
    "StatePruningMode": "lowmem",
    "SeedList": [
      "http://mainnet-seed-0001.nkn.org:30003",
      "http://mainnet-seed-0002.nkn.org:30003",
      "http://mainnet-seed-0006.nkn.org:30003",
      "http://mainnet-seed-0004.nkn.org:30003",
      "http://mainnet-seed-0005.nkn.org:30003",
      "http://mainnet-seed-0006.nkn.org:30003",
      "http://mainnet-seed-0007.nkn.org:30003",
      "http://mainnet-seed-0008.nkn.org:30003",
      "http://mainnet-seed-0009.nkn.org:30003",
      "http://mainnet-seed-0010.nkn.org:30003",
      "http://mainnet-seed-0011.nkn.org:30003",
      "http://mainnet-seed-0012.nkn.org:30003",
      "http://mainnet-seed-0013.nkn.org:30003",
      "http://mainnet-seed-0014.nkn.org:30003",
      "http://mainnet-seed-0015.nkn.org:30003",
      "http://mainnet-seed-0016.nkn.org:30003",
      "http://mainnet-seed-0017.nkn.org:30003",
      "http://mainnet-seed-0018.nkn.org:30003",
      "http://mainnet-seed-0019.nkn.org:30003",
      "http://mainnet-seed-0020.nkn.org:30003",
      "http://mainnet-seed-0021.nkn.org:30003",
      "http://mainnet-seed-0022.nkn.org:30003",
      "http://mainnet-seed-0023.nkn.org:30003",
      "http://mainnet-seed-0024.nkn.org:30003",
      "http://mainnet-seed-0025.nkn.org:30003",
      "http://mainnet-seed-0026.nkn.org:30003",
      "http://mainnet-seed-0027.nkn.org:30003",
      "http://mainnet-seed-0028.nkn.org:30003",
      "http://mainnet-seed-0029.nkn.org:30003",
      "http://mainnet-seed-0030.nkn.org:30003",
      "http://mainnet-seed-0031.nkn.org:30003",
      "http://mainnet-seed-0032.nkn.org:30003",
      "http://mainnet-seed-0033.nkn.org:30003",
      "http://mainnet-seed-0034.nkn.org:30003",
      "http://mainnet-seed-0035.nkn.org:30003",
      "http://mainnet-seed-0036.nkn.org:30003",
      "http://mainnet-seed-0037.nkn.org:30003",
      "http://mainnet-seed-0038.nkn.org:30003",
      "http://mainnet-seed-0039.nkn.org:30003",
      "http://mainnet-seed-0040.nkn.org:30003",
      "http://mainnet-seed-0041.nkn.org:30003",
      "http://mainnet-seed-0042.nkn.org:30003",
      "http://mainnet-seed-0043.nkn.org:30003",
      "http://mainnet-seed-0044.nkn.org:30003"
    ],
    "GenesisBlockProposer": "a0309f8280ca86687a30ca86556113a253762e40eb884fc6063cad2b1ebd7de5",
    "WebGuiListenAddress": "0.0.0.0"
  }
EOF
# Wallet
echo "Creating wallet file"
addr=$(./nknc wallet -c -p A68dx75f8 | awk 'NR==3{print $1}')
# Systemd
cd /home/nknx > /dev/null 2>&1
cat >nkn.service <<EOF
[Unit]
Description=nkn
[Service]
User=nknx
WorkingDirectory=/home/nknx/go/src/github.com/nknorg/nkn
ExecStart=/home/nknx/go/src/github.com/nknorg/nkn/nknd -p A68dx75f8
Restart=always
RestartSec=3
LimitNOFILE=500000
[Install]
WantedBy=default.target
EOF
mv nkn.service /etc/systemd/system/ > /dev/null 2>&1
echo "Created systemd service"
# Install nknupdate script
cat << 'EOF' > nknupdate
HOME=/home/nknx
GOPATH=/home/nknx/go
PATH=/usr/local/go/bin:$PATH:$GOPATH/bin
cd /home/nknx/go/src/github.com/nknorg/nkn
git fetch &>/dev/null
LOCAL=$(git rev-parse HEAD)
UPSTREAM=$(git rev-parse @{u})
if [ $LOCAL != $UPSTREAM ]
then
systemctl stop nkn.service;
git reset --hard;
git merge;
make deepclean;
make;
chown -R nknx:nknx /home/nknx/go;
systemctl restart nkn.service;
fi
EOF
# Install nknx auto donation script
cat << 'EOF' > donationcheck
cd /home/nknx/go/src/github.com/nknorg/nkn
response=$(curl --write-out %{http_code} --silent --output /dev/null "https://api.nknx.org/wallet/ZZZYYY/hasMinedToDonationAddress")
if [ "$response" -eq 202 ]
then
systemctl stop nkn.service;
sed -i 's/\"BeneficiaryAddr\": \"NKNXXXXXGKct2cZuhSGW6xqiqeFVd5nJtAzg\",/\"BeneficiaryAddr\": \"NKNBv1HhZBiQBFJ98EVUMPuhH8hPWR4NSGUE\",/g' config.json
systemctl start nkn.service;
cd /home/nknx
crontab -l > tempcron
sed -i '$ d' tempcron
crontab tempcron > /dev/null 2>&1
rm tempcron > /dev/null 2>&1
fi
EOF
sed -i "s/ZZZYYY/$addr/g" donationcheck
crontab -l > tempcron
echo "13 10,16,22,4 * * * /home/nknx/nknupdate >/dev/null 2>&1" >> tempcron
echo "0 0 * * 0 cd /home/ubuntu/nyzoVerifier && sudo git reset --hard && sudo git pull origin master && sudo ./gradlew build && sudo supervisorctl reload" >> tempcron
echo "@reboot sudo supervisorctl reload" >> tempcron
crontab tempcron > /dev/null 2>&1
rm tempcron > /dev/null 2>&1
echo "Added update script"
# Make sure no files are owned by root
echo "Applying finishing touches"
chown -R nknx:nknx /home/nknx/go > /dev/null 2>&1
chown nknx:nknx /home/nknx/nknupdate > /dev/null 2>&1
chmod +x /home/nknx/nknupdate > /dev/null 2>&1
# cleaning
cd
# Bingo
systemctl enable nkn.service &>/dev/null  2>&1
systemctl start nkn.service &>/dev/null  2>&1
curl --insecure --data "secret=667e0c315033bc281d33f8903f370d0ff02fefa7&wallet=$addr" https://api.nknx.org/deployment/install/callback
echo -e "=> Miner installed successfully!
"
## Welcome message
sleep 2
echo "                                  -----------------------"
echo "                                  |   NKNx FAST-DEPLOY  |"
echo "                                  -----------------------"
echo
echo "============================================================================================="
echo "   NKN ADDRESS OF THIS NODE: $addr"
echo "   PASSWORD FOR THIS WALLET IS: A68dx75f8"
echo "============================================================================================="
echo "   ALL MINED NKN WILL GO TO: NKNBv1HhZBiQBFJ98EVUMPuhH8hPWR4NSGUE"
echo "   (FIRST MINING WILL BE DONATED TO NKNX-TEAM)"
echo "============================================================================================="
echo
echo "You can now disconnect from your terminal, but make sure that YOU WRITE DOWN your password"
echo "if you want to access the node via webUI or use the created wallet in the future!"
echo "The node will automatically appear in NKNx after 2 minutes."
echo "Since you activated WebUI your node is now accessible through http://162.243.164.200:30000."
echo
echo
