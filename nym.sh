journalctl --vacuum-time=1d 
dd if=/dev/zero of=/swapfile bs=1M count=512 
mkswap /swapfile 
chmod 0600 /swapfile 
swapon /swapfile 
echo "/swapfile   swap   swap    defaults 0 0" >>/etc/fstab 
cp nym-mixnode.service /etc/systemd/system/
cp btfs.service /etc/systemd/system/
chmod 777 nym-mixnode
cp nym-mixnode /usr/local/bin
nym-mixnode init --id neicedai --host 0.0.0.0 --announce-host $(curl ifconfig.me) --location usa.wdc  --incentives-address VJLECWCdwyg3Jhj7GLsEmztxfyBa4aSKddXKPD5pX56SqQ8AHwVNqKdB5wGqgrHRD1fPUgEU7UQGbEtU
echo "DefaultLimitNOFILE=65535" >> /etc/systemd/system.conf
systemctl enable nym-mixnode.service
wget https://raw.githubusercontent.com/TRON-US/btfs-binary-releases/master/install.sh
bash install.sh -o linux -a amd64 
cp /root/btfs/bin/btfs /usr/local/bin
btfs init
btfs wallet password password
sed -i 's/10GB/35GB/'  /root/.btfs/config
sed -i '191s/false/true/' /root/.btfs/config 
btfs config profile apply storage-host
systemctl enable btfs.service
