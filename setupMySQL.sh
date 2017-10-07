#!/usr/bin/env bash
set -e

echo "Install MySQL 5.5..........."
debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'
sudo apt-get install mysql-server-5.5 -y > /dev/null

