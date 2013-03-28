#!/usr/bin/env bash

apt-get update
apt-get install -y nginx build-essential python-software-properties python g++ make ruby1.9.3 git
gem install sass
add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
curl http://npmjs.org/install.sh | sudo sh
rm -rf /var/www
rm -rf /etc/nginx/nginx.conf
rm -rf /etc/nginx/sites-enabled
ln -fs /vagrant/build /var/www
ln -fs /vagrant/server-config/sites-enabled /etc/nginx/sites-enabled
ln -s /vagrant/server-config/nginx.conf /etc/nginx/nginx.conf
service nginx restart
cd /vagrant
npm install
npm install grunt-cli -g
npm install bower -g
bower install
grunt build
grunt watch
