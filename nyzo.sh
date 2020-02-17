
cd /home/ &&

mkdir ubuntu &&

cd ubuntu &&

sudo ufw allow 9444/tcp &&

sudo apt update &&

sudo apt install haveged openjdk-8-jdk supervisor -y &&
sudo git clone https://github.com/n-y-z-o/nyzoVerifier.git &&
cd nyzoVerifier &&

sudo ./gradlew build &&

sudo mkdir -p /var/lib/nyzo/production &&

sudo cp trusted_entry_points /var/lib/nyzo/production &&

chmod 777 nyzoVerifier.sh &&

./nyzoVerifier.sh &&

sudo cp nyzoVerifier.conf /etc/supervisor/conf.d/ &&


sleep 4s &&

sudo supervisorctl status &&

more /var/lib/nyzo/production/verifier_private_seed
