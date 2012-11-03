#!/bin/bash

#install RVM in multi user mode (rvmsudo)

aptbin=aptitude
currentUser=`whoami`

sudo $aptbin -y update 
sudo $aptbin -y dist-upgrade

sudo $aptbin -y install curl git bash bash-completion patch diffutils build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion libcurl4-openssl-dev 
sudo $aptbin -y install mysql-client mysql-server libmysqlclient-dev
sudo $aptbin -y install postgresql libpq-dev
sudo $aptbin -y install apache2-mpm-worker apache2-utils libapache2-mod-fcgid apache2-suexec-custom apache2-threaded-dev curl postfix
sudo $aptbin -y install imagemagick libmagickcore-dev libmagickwand-dev

sudo $aptbin --purge remove ruby-rvm
sudo rm -rf /usr/share/ruby-rvm /etc/rvmrc /etc/profile.d/rvm.sh

curl -L https://get.rvm.io | sudo bash -s stable --auto

sudo adduser $currentUser rvm
echo "umask g+w " >> ~/.bashrc
echo "source /etc/profile.d/rvm.sh " >> ~/.bashrc
umask g+w
source /etc/profile.d/rvm.sh

echo "now you must log out (from terminal and X session) and login again to use rvm without rvmsudo"