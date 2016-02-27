#!/bin/bash
#centos 6.5 centos7.1 

echo "-------------------------------------------------------------"
echo "- Oneclick Install serverSpeeder(CentOS)                    -"
echo "- WelCome to visit: https://www.share123.org                -"
echo "- 2016/2/27                                                 -"
echo "-------------------------------------------------------------"

rm -rf /serverspeeder
rm -rf /etc/init.d/serverSpeeder
rm -rf /tmp/ssinstall
mkdir /tmp/ssinstall
cd /tmp/ssinstall

SysBit=$(getconf LONG_BIT)
if [[ $SysBit == 32 ]]; then
  echo "Only x86_64 system supported"
  exit 0
fi

if [ -f "/etc/redhat-release" ]; then
  if cat /etc/redhat-release | grep CentOS>/dev/null ;then
    SysName=CentOS
    Kernelversion=$(cat /proc/version | awk '{print $3}' | awk -F - '{print $1}')
    Kernelsmallversion=$(cat /proc/version | awk '{print $3}' | awk -F - '{print $2}'| awk  -F '' '{OFS="";print $1,$2,$3}')
    Sysversion=$(cat /etc/redhat-release | awk -F 'release ' '{print $2}' | awk  -F '' '{OFS="";print $1,$2,$3}')
    yum -y install unzip
  fi
elif [ -f "/etc/debian_version" ]; then
  SysName=Debian
  Kernelversion=$(cat /proc/version | awk '{print $3}' | awk -F - '{print $1}')
  Sysversion=$(cat /etc/debian_version | awk  -F '' '{OFS="";print $1,$2,$3}')
  apt-get update
  apt-get -y install unzip
else
  echo "Only CentOS and Debian supported"
fi

if [[ $SysName == CentOS ]]; then
  if [[ $Sysversion =~ 6.[0-9] ]]; then
    if [[ $Kernelversion == 2.6.32 ]]; then
      if [[ $SysBit == 64 ]]; then
        wget https://www.share123.org/ssinstall/CentOS_6.6_2.6.32-573.1.1.el6.x86_64.zip && unzip CentOS_6.6_2.6.32-573.1.1.el6.x86_64.zip
        cp -a CentOS_6.6_2.6.32-573.1.1.el6.x86_64/* .
        chattr -i /tmp/ssinstall/apxfiles/bin/acce-3.10.66.29-[CentOS_6.6_2.6.32-573.1.1.el6.x86_64]
        getacce="/serverspeeder/bin/acce-3.10.66.29-[CentOS_6.6_2.6.32-573.1.1.el6.x86_64]"
        if [[ $Kernelsmallversion != 573 ]]; then
          echo "Warning:We can not find the acce suited to this sever.Use 2.6.32-573 instead."
        fi
      fi
    fi
  elif [[ $Sysversion =~ 7.[0-9] ]]; then
    if [[ $Kernelversion == 3.10.0 ]]; then
      if [[ $SysBit == 64 ]]; then
        if [[ $Kernelsmalllversion == 229 ]]; then
          wget https://www.share123.org/ssinstall/CentOS_7.1_3.10.0-229.1.2.el7.x86_64.zip && unzip CentOS_7.1_3.10.0-229.1.2.el7.x86_64.zip
          cp -a CentOS_7.1_3.10.0-229.1.2.el7.x86_64/* .
          chattr -i /tmp/ssinstall/apxfiles/bin/acce-3.10.61.12-[CentOS_7.1_3.10.0-229.1.2.el7.x86_64]
          getacce="/serverspeeder/bin/acce-3.10.61.12-[CentOS_7.1_3.10.0-229.1.2.el7.x86_64]"
        elif [[ $Kernelsmalllversion == 123 ]]; then
          wget https://www.share123.org/ssinstall/CentOS_7.0_3.10.0-123.x86_64.zip && unzip CentOS_7.0_3.10.0-123.x86_64.zip
          cp -a CentOS_7.0_3.10.0-123.x86_64/* .
          chattr -i /tmp/ssinstall/apxfiles/bin/acce-3.10.66.29-[CentOS_7.0_3.10.0-123.x86_64]
          getacce="/serverspeeder/bin/acce-3.10.66.29-[CentOS_7.0_3.10.0-123.x86_64]"
        else
          echo "Warning:We can not find the acce suited to this sever.Use 3.10.0-229 instead." 
          wget https://www.share123.org/ssinstall/CentOS_7.1_3.10.0-229.1.2.el7.x86_64.zip && unzip CentOS_7.1_3.10.0-229.1.2.el7.x86_64.zip
          cp -a CentOS_7.1_3.10.0-229.1.2.el7.x86_64/* .
          chattr -i /tmp/ssinstall/apxfiles/bin/acce-3.10.61.12-[CentOS_7.1_3.10.0-229.1.2.el7.x86_64]
          getacce="/serverspeeder/bin/acce-3.10.61.12-[CentOS_7.1_3.10.0-229.1.2.el7.x86_64]"
        fi
      fi
    fi
  fi
elif [[ $SysName == Debian ]]; then
  if [[ $Sysversion =~ 6.[0-9] ]]; then
    if [[ $Kernelversion == 2.6.32 ]]; then
      if [[ $SysBit == 64 ]]; then
        wget https://www.share123.org/ssinstall/Debian_6.0_2.6.32-5-amd64.zip --no-check-certificate && unzip Debian_6.0_2.6.32-5-amd64.zip
        cp -a Debian_6.0_2.6.32-5-amd64/* .
        chattr -i /tmp/ssinstall/apxfiles/bin/acce-3.10.61.0-[Debian_6.0_2.6.32-5-amd64]
        getacce="/serverspeeder/bin/acce-3.10.61.0-[Debian_6.0_2.6.32-5-amd64]"
      fi
    fi
  elif [[ $Sysversion =~ 7.[0-9] ]]; then
    if [[ $Kernelversion == 3.2.0 ]]; then
      if [[ $SysBit == 64 ]]; then
        wget https://www.share123.org/ssinstall/debian.zip --no-check-certificate && unzip debian.zip
        cp -a debian/* .
        wget -O /tmp/ssinstall/apxfiles/bin/kernel https://www.share123.org/ssinstall/serverspeeder_2626 --no-check-certificate
        chattr -i /tmp/ssinstall/apxfiles/bin/kernel
        getacce="/serverspeeder/bin/kernel"
      fi
    fi
  fi
fi

MAC=$(ip link | awk -F ether '{print $2}' | awk NF | awk '{print $1}')
echo "MAC Address is $MAC"

wget -O /tmp/ssinstall/apxfiles/etc/apx-20341231.lic "http://api.ifdream.net/project/server_speeder-lic.php?mac=$MAC&bw=0&year=2038" --no-check-certificate
wget -O /tmp/ssinstall/apxfiles/etc/config "https://www.share123.org/ssinstall/config" --no-check-certificate
wget -O /tmp/ssinstall/apxfiles/bin/serverSpeeder.sh https://public-lib.idc.wiki/serverSpeeder/server.ServerSpeeder.sh --no-check-certificate

wget -O sysid-64 "https://www.share123.org/ssinstall/sysid-64" --no-check-certificate
chmod 700 sysid-64
getserial=$(./sysid-64)

echo "
apxexe="$getacce"
serial="$getserial"
email="liwentao0705@outlook.com"
installerID="=QzM"
" >> /tmp/ssinstall/apxfiles/etc/config

bash install.sh

chattr -i $getacce
chattr -i /serverspeeder/apxfiles/etc/apx-20341231.lic

/serverspeeder/bin/serverSpeeder.sh status

echo ---------------------------------------------
echo Enjoy! Have a good time!
echo WelCome to visit: https://www.share123.org
echo ---------------------------------------------

echo "--- Thanks For ---"
echo "Huanmeng : https://github.com/HuanMeng0/ServerSpeederCrackScript (gayhub)"
echo "Diaoji : Optimization the install step and script "
echo "iForday : https://github.com/iForday/One-Click-ServerSpeeder-Install "
echo "wentao : Optimization the install step and script "
