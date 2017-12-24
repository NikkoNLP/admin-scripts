#!/bin/bash
# Author: Nikko Pedersen
# Date: 12/11/2017
# Purpose: Search RPMs for apache versions and install
# Interactive: Yes
#=====================================================
### Environment Variables
LOG=/var/log/messages
PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin

### Functions
## Check if OS is Ubuntu or CentOS/RedHat
checkOS () {
if [[ -f /etc/redhat-release ]] || [[ -f /bin/yum ]];then
	OS=redhat
elif [[ -f /etc/lsb-release ]]; then
	OS=ubuntu
else
	echo "Cannot Determine OS Version. Exiting..." >> $LOG
	echo "Cannot Determine OS Version"
	echo "Exiting..."
fi
}

install_IUS (distro) {
if [[ $distro == redhat ]];then
	if 

elif [[ $distro == ubuntu ]];then


fi
yum install -y https://$(rpm -E '%{?centos:centos}%{!?centos:rhel}%{rhel}').iuscommunity.org/ius-release.rpm

}

### Check if IUS and EPEL Are installed
checkOS

if [[ $OS == redhat ]];then
	install_IUS(redhat)
elif [[ $OS == ubuntu ]];then
fi

yum install -y epel-release


### Search current RPMs for apache versions available
if [[ $OS == redhat ]];then
# Grab from KVM-Test	
elif [[ $OS == ubuntu ]];then
# Grab from KVM-Test	
fi

### 
