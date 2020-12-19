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
