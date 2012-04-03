#!/bin/bash
sudo apt-get install squid apache2 imagemagick
cat etc/squid/squid.conf >> /etc/squid/squid.conf
cp etc/apache2/sites-enabled/squid /etc/apache2/sites-enabled/000-squid
cp -r var/www/squid /var/www/

chown -R www-data:www-data /var/www/squid

# Add proxy to the www-data group and vice versa
usermod -aG www-data proxy
usermod -aG proxy www-data

# Restart apache and squid
/etc/init.d/apache2 restart
stop squid
start squid

