
cd /home/ &&

mkdir ubuntu &&

cd ubuntu &&
echo "1"  &&
sudo apt update &&
echo "2"  &&
sudo apt install haveged openjdk-8-jdk supervisor -y &&

sudo git clone https://github.com/n-y-z-o/nyzoVerifier.git &&
cd nyzoVerifier &&

sudo ./gradlew build &&

sudo mkdir -p /var/lib/nyzo/production &&

sudo cp trusted_entry_points /var/lib/nyzo/production &&

chmod 777 nyzoVerifier.sh &&

./nyzoVerifier.sh &&

sudo cp nyzoVerifier.conf /etc/supervisor/conf.d/ &&


sleep 4s
