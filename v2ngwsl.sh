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
if dpkg -l | grep -Eqi "nginx|apache|caddy"; then
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

#sources list
cd /etc/apt/
mv sources.list sources.list.bak
apt -y install wget
wget --no-check-certificate -O sources.list https://raw.githubusercontent.com/uselibrary/scripts/master/files/sources.list
apt -y update && apt -y upgrade
apt -y install curl

#creat v2ray pass
touch /home/v2raypass

#install v2ray
cd /home/
bash <(curl -L -s https://install.direct/go.sh)
systemctl enable v2ray
systemctl start v2ray
#v2ray config/
cd /etc/v2ray/
mv config.json config.json.bak
wget --no-check-certificate -O config.json https://raw.githubusercontent.com/uselibrary/scripts/master/files/config.json
uuid=$(cat /proc/sys/kernel/random/uuid)
sed "s/youruuid/${uuid}/g" config.json -i
read -p "please input your WebPath: " webpath
sed "s/yourwebpath/${webpath}/g" config.json -i
echo "your uuid is: " >> /home/v2raypass
echo $uuid >> /home/v2raypass
echo "your web path is: " >> /home/v2raypass
echo $webpath >> /home/v2raypass
systemctl restart v2ray

#install nginx
apt -y install nginx
systemctl enable nginx
systemctl start nginx
#nginx config
cd /etc/nginx/
mv nginx.conf nginx.conf.bak
wget --no-check-certificate -O nginx.conf https://raw.githubusercontent.com/uselibrary/scripts/master/files/nginx.conf
cd /etc/nginx/sites-available/
mv default default.bak
wget --no-check-certificate -O default https://raw.githubusercontent.com/uselibrary/scripts/master/files/default
sed "s:location / {:location /${webpath}{:g" default -i
read -p "please input yourdomain: " domain
sed "s/server_name _;/server_name ${domain};/g" default -i
echo "your domain is: "
echo $domain >> /home/v2raypass
systemctl restart nginx

#404.html
cd /var/www/
rm -rf 404.html
wget --no-check-certificate -O 404.html https://raw.githubusercontent.com/uselibrary/scripts/master/files/404.html

#letsencrypt
cd /home/
apt -y install certbot python-certbot-nginx -t stretch-backports
certbot --nginx

#reboot
echo "v2ray websocket nginx tls is installed"
echo ""
echo "It is recommended to reboot"
