#!/usr/bin/env bash
set -e

echo "Stopping apache2...."
sudo service apache2 stop

echo "Stopping database...."
sudo service mysql stop

echo "Stopping web server...."
sudo service nginx stop

echo "Stopping app server...."
sudo service tomcat7 stop

