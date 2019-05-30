#!/bin/bash
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #                 set up v2ngwsl               #"
echo "    #                  https://pa.ci               #"
echo "    #                   Version 0.1                #"
echo "    ################################################"
#


if dpkg -l | grep -Eqi "nginx"; then
  echo "nginx installed"
else
  echo "no"
fi

if ps –ef |grep -Eqi "v2ray"; then




echo -e ""
if lsmod | grep -Eqi v2ray|nginx; then
  echo "the current kernel is:"
  uname -r
  echo "bbr is running"
  echo "***EXIT***"
  exit
fi
#Prepare environment
echo -e "Prepare environment."
if cat /etc/*-release | grep -Eqi "centos-7"; then
  echo "CentOS 7"
  yum -y update && yum -y bc
elif cat /etc/*-release | grep -Eqi "debian|ubuntu"; then
  echo "Debian-based"
  apt -y update && apt -y upgrade -y && apt -y install bc
else
  echo "Not supported version"
  echo "***EXIT***"
fi
