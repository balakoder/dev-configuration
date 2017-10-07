echo "Installing node js..........."
sudo apt-get -y --purge remove node nodejs npm
sudo apt-get -y autoremove
 
sudo apt-get update -y
sudo apt-get install -y python-software-properties python g++ make  > /dev/null
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update  -y  > /dev/null
sudo apt-get install -y nodejs  > /dev/null
 
echo "Installing grunt and bower..........."
sudo npm install -g grunt grunt-docular
sudo npm install -g grunt-cli -y  > /dev/null 
sudo npm install -g bower --allow-root -y  > /dev/null
