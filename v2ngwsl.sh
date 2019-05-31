#!/bin/bash
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #                 set up v2ngwsl               #"
echo "    #                  https://pa.ci               #"
echo "    #                   Version 0.1                #"
echo "    ################################################"
#check system
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
  echo "***EXIT***"
  sleep 1
  exit
fi
if [ -d "/etc/v2ray/" ]; then
  echo "System is modified"
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
    echo "bbr is install"
  else
    echo "There is something wrong with bbr"
    echo "please check your system"
    echo "***EXIT***"
    sleep 2
    exit
  fi
fi
#install nginx
apt -y update && apt -y upgrade && apt -y install nginx
systemctl enable nginx
systemctl start nginx
