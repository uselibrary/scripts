#!/bin/bash
clear
echo "    ################################################"
echo "    #                                              #"
echo "    #                   set up bbr                 #"
echo "    #                  https://pa.ci               #"
echo "    #                   Version 0.1                #"
echo "    ################################################"
#Prepare environment
echo -e ""
echo -e "Prepare environment."
if cat /etc/*-release | grep -Eqi "centos|red hat|redhat"; then
  echo "RPM-based"
  yum -y update && yum -y bc
elif cat /etc/*-release | grep -Eqi "debian|ubuntu"; then
  echo "Debian-based"
  apt -y update && apt -y upgrade -y && apt -y install bc
else
  echo "Not supported version"
  echo "***EXIT***"
fi
#set up bbr
if lsmod | grep -Eqi bbr; then
  echo "the current kernel is:"
  uname -a
  echo "bbr is running"
else
  bbrkernel=4.89
  kernelversion=$(uname -r)
  fullkvstring=`echo ${kernelversion%%-*}`
  echo $fullkvstring
  mainkvstring=`echo ${fullkvstring%.*}`
  echo $mainkvstring
  if [ `echo "$mainkvstring > $bbrkernel"|bc` -eq 0 ]; then
    echo "upgrade kernel"
    if cat /etc/*-release | grep -Eqi "centos|red hat|redhat"; then
      yum -y install yum-plugin-fastestmirror
      cat /etc/os-release
      uname -msr
      rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
      rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
      yum repolist
      yum --enablerepo=elrepo-kernel install kernel-ml
      awk -F\' '$1=="menuentry " {print i++ " : " $2}' /etc/grub2.cfg
      grub2-set-default 0
      grub2-mkconfig -o /boot/grub2/grub.cfg
    elif cat /etc/*-release | grep -Eqi "debian|ubuntu"; then
      echo "Please upgrade the kernel manually"
    else
      echo "Not supported version"
      echo "***EXIT***"
    fi
  else
    echo "set up bbr"
    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
  fi
#reboot
reboot
