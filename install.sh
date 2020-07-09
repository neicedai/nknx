clear
echo "============================================================================================="
echo "                              WELCOME TO NKNx FAST DEPLOY!"
echo "============================================================================================="
echo
echo "This script will automatically provision a node as you configured it in your snippet."
echo "So grab a coffee, lean back or do something else - installation will take about 5 minutes."
echo -e "============================================================================================="
echo
echo "Hardening your OS..."
echo "---------------------------"
export DEBIAN_FRONTEND=noninteractive
apt-get -qq update > /dev/null 2>&1
apt-get -qq upgrade -y > /dev/null 2>&1
echo "Installing necessary libraries..."
echo "---------------------------"
apt-get install make curl git unzip whois makepasswd -y --allow-downgrades --allow-remove-essential --allow-change-held-packages > /dev/null 2>&1
apt-get install unzip jq -y --allow-downgrades --allow-remove-essential --allow-change-held-packages > /dev/null 2>&1
useradd nknx
mkdir -p /home/nknx/.ssh
mkdir -p /home/nknx/.nknx
adduser nknx sudo
chsh -s /bin/bash nknx
PASSWORD=$(mkpasswd A68dx75f8!)
usermod --password $PASSWORD nknx > /dev/null 2>&1
cd /home/nknx
echo "Installing NKN Commercial..."
echo "---------------------------"
wget --quiet --continue --show-progress https://commercial.nkn.org/downloads/nkn-commercial/linux-amd64.zip > /dev/null 2>&1
unzip -qq linux-amd64.zip
cd linux-amd64
cat >config.json <<EOF
{
    "nkn-node": {
      "noRemotePortCheck": true
    }
}
EOF
./nkn-commercial -b NKNFnqg1k52SGCZ8qkzVZN29EtLGFWLwTxy9 -c /home/nknx/linux-amd64/config.json -d /home/nknx/nkn-commercial -u nknx install > /dev/null 2>&1
chown -R nknx:nknx /home/nknx
chmod -R 755 /home/nknx
echo "Waiting for wallet generation..."
echo "---------------------------"
while [ ! -f /home/nknx/nkn-commercial/services/nkn-node/wallet.json ]; do sleep 10; done
echo "Downloading pruned snapshot..."
echo "---------------------------"
cd /home/nknx/nkn-commercial/services/nkn-node/
systemctl stop nkn-commercial.service
rm -rf ChainDB
wget --quiet --continue --show-progress https://nkn.org/ChainDB_pruned_latest.zip
echo "Extracting pruned snapshot..."
echo "---------------------------"
unzip -qq ChainDB_pruned_latest.zip
rm ChainDB_pruned_latest.zip
chown -R nknx:nknx ChainDB/
systemctl start nkn-commercial.service
echo "Applying finishing touches..."
echo "nkn finish"
