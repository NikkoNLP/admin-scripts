#!/bin/bash
# Updated: 12/30/2017
# Purpose: Search RPMs for apache versions and install
# Interactive: Yes
#=====================================================
### Environment Variables
LOG=/var/log/messages
PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
## Import Bash Functions
source ../bashFunctions
## Import functions:
checkOS
softwareCheck
firewallCheck

### Custom Functions
## Check if OS is Ubuntu or CentOS/RedHat
configureRepos () {
if [[ "$OS" == redhat ]];then
	yum install -y epel-release
	yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm
elif [[ "$OS" == ubuntu ]];then
	apt-get update
fi
}

## Install latest version of apache
installApache () {
if [[ "$OS" == redhat ]];then
	yum install httpd -y
elif [[ "$OS" == ubuntu ]];then
        apt-get install apache2 -y
fi
}

## Restart Apache
restartApache () {
if [[ "$systemType" == "sysvinit" ]];then
        if [[ "$OS" == "redhat" ]];then
                systemctl restart httpd
        elif [[ "$OS" == "ubuntu" ]];then
                systemctl restart apache2
        fi
else
	if [[ "$OS" == "redhat" ]];then
		service httpd restart
	elif [[ "$OS" == "ubuntu" ]];then
		service apache2 restart
	fi
fi
}

## Enable the Apache Service
enableApache () {
if [[ "$systemType" == "sysvinit" ]];then
	if [[ "$OS" == "redhat" ]];then
		systemctl enable httpd
	else
		systemctl enable apache2
	fi
elif [[ "$systemType" == "systemd" ]];then
	if [[ "$OS" == "redhat" ]];then
		chkconfig httpd on
	else
		chkconfig apache2 on
	fi
elif [[ "$systemType" == "upstart" ]];then
	update-rc.d apache2 enable
fi
}

## Install Basic Apache Modules
enableApacheSsl () {
if [[ "$OS" == "redhat" ]];then
        yum install -y mod_ssl
	restartApache
elif [[ "$OS" == "ubuntu" ]];then
        a2enmod ssl
	restartApache
fi
}

## Open ports 80 and 443 in the firewall
openFirewallApache () {
if [[ "$firewall" == "csf" ]];then
	if egrep -q "TCP_IN.*80.*443|TCP_IN.*443.*80" /etc/csf/csf.conf;then
		 echo "Ports 80 and 443 are already Open"
	else
		INPORTS=`grep "TCP_IN =" /etc/csf/csf.conf | sed "s/\"$/,80,443\"/g"`
		OUTPORTS=`grep "TCP_OUT =" /etc/csf/csf.conf | sed "s/\"$/,80,443\"/g"`
		sed -i '/'"TCP_IN ="'/c\'"$INPORTS"'' /etc/csf/csf.conf
		sed -i '/'"TCP_OUT ="'/c\'"$OUTPORTS"'' /etc/csf/csf.conf
		csf -r
	fi
elif [[ "$firewall" == "iptables" ]];then
	echo "iptables"
fi
}

