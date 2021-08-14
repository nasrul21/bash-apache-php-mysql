#!/bin/bash

install_apache() {
	echo "mengupdate repository apt"
	sudo apt-get update
	echo "menginstall apache webserver"
	sudo apt-get -y install apache2
	echo "selesai menginstall apache"
}

install_php() {
	echo "persiapan setup php"
	sudo apt-get -y install software-properties-common
	sudo add-apt-repository ppa:ondrej/php
	echo "mengupdate ulang repository apt"
	sudo apt-get update
	echo "menginstall php7.4"
	sudo apt-get -y install php7.4 php7.4-mcrypt php7.4-mysql
	echo "selesai menginstall php"
}

install_mysql() {
	echo "menginstall mysql"
	debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
	debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
	sudo apt-get install -y mysql-server
	echo "restart service mysql"
	service mysql restart
	echo "selesai menginstall mysql"
}

install_apache
install_php
install_mysql

exit 0
