sudo apt install pkg-config build-essential libssl-dev curl jq
bash rusetup.sh -y
source $HOME/.cargo/env 
cd /home/ubuntu
rustup update
git clone https://github.com/nymtech/nym.git
cd nym
git reset --hard # in case you made any changes on your branch
git pull # in case you've checked it out before
#
# Note: the default branch you clone from Github, `develop`, is guaranteed to be
# broken and incompatible with the running testnet at all times. You *must*
# `git checkout tags/v0.9.2` in order to join the testnet.
#
git checkout tags/v0.9.2
cargo build --release
cd /home/ubuntu/nym/target/release
cp nym-mixnode /usr/local/bin
nym-mixnode init --id neicedai --host 0.0.0.0 announce-host $(curl ifconfig.me) --location usa.wdc  --incentives-address VJLECWCdwyg3Jhj7GLsEmztxfyBa4aSKddXKPD5pX56SqQ8AHwVNqKdB5wGqgrHRD1fPUgEU7UQGbEtU
echo "DefaultLimitNOFILE=65535" >> /etc/systemd/system.conf
systemctl enable nym-mixnode.service
