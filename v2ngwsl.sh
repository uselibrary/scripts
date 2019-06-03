#!/bin/bash
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #                 set up v2ngwsl               #"
echo "    #                  https://pa.ci               #"
echo "    #                   Version 0.1                #"
echo "    ################################################"

#check system debian 9
echo -e ""
if cat /etc/*-release | grep -Eqi "debian gnu/linux 9"; then
  echo "Debian 9"
else
  echo "Only Debain 9 is supported"
  echo "***EXIT***"
  sleep 1
  exit
fi
if dpkg -l | grep -Eqi "nginx|apache"; then
  echo "System is modified"
  echo "Pure Debain 9 is needed"
  echo "***EXIT***"
  sleep 1
  exit
fi
if [ -d "/etc/v2ray/" ]; then
  echo "System is modified"
  echo "Pure Debain 9 is needed"
  echo "***EXIT***"
  sleep 1
  exit
fi

#update
apt -y update && apt -y upgrade

#satrt bbr
if lsmod | grep -Eqi bbr; then
  echo "bbr is running"
else
  echo "set up bbr"
  echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
  echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
  sysctl -p
  if lsmod | grep -Eqi bbr; then
    echo "bbr is installed"
  else
    echo "There is something wrong with bbr"
    echo "please check your system"
    echo "***EXIT***"
    sleep 1
    exit
  fi
fi

#install v2ray
bash <(curl -L -s https://install.direct/go.sh)
systemctl enable v2ray
systemctl start v2ray
#v2ray config
mv config.json config.json.bak
wget --no-check-certificate -O config.json https://raw.githubusercontent.com/uselibrary/scripts/master/config.json
echo "View www.uuidgenerator.net to get a UUID"
read -p "please input your UUID: " uuid
sed "s/youruuid/${uuid}/g" config.json -i
read -p "please input your WebPath: " webpath
sed "s/yourwebpath/${webpath}/g" config.json -i

#install nginx
apt -y install nginx
systemctl enable nginx
systemctl start nginx
#nginx config
cd /etc/nginx/sites-available/
mv default default.bak
wget --no-check-certificate -O default https://raw.githubusercontent.com/uselibrary/scripts/master/default
sed "s:location / {:location /${webpath}{:g" default -i




read -p "please input yourdomain: " domain
sed "s/server_name _;/server_name ${domain};/g" default -i
