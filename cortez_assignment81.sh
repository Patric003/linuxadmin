#!/bin/sh

# Installing Apache HTTP server
yum install -y httpd

#To start HTTPD as service
systemctl start httpd

#Allow traffic to our web server
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

#Reload Firewall
firewall-cmd --reload

#Enable HTTPD again
systemctl enable httpd

#Installation of Fedora, remi, utils
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils

#Enable remi
yum-config-manager --enable remi-php56

#Install mysql php
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

#Restart HTTPD
systemctl restart httpd

#Installtion of MariaDB
yum install -y mariadb-server mariadb
systemctl start mariadb

#Enable mariaDB
mysql_secure_installation
systemctl enable mariadb

#for the root password
mysql -u root -p