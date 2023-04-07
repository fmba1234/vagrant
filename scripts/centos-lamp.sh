#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-level httpd-tools

chkconfig --add httpd
chkconfig httpd on
chkconfig httpd stop


rm -rf /var/www/html
ln -s /vagrant /var/www/html


service httpd start

# PHP
# yum install -y php php-cli php-common php-devel php-mysql

# MySQL
# yum install -y mysql mysql-server mysql-devel
chkconfig --add mysql
chkconfig mysql on


service mysql start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content


service httpd restart
