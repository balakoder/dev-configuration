#!/usr/bin/env bash
set -e

echo "Configuring Nginx....."
sudo cp /vagrant_data/nginx_vhost /etc/nginx/sites-available/nginx_vhost  > /dev/null
  
sudo ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/ | true
  
sudo rm -rf /etc/nginx/sites-available/default
