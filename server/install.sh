#!/bin/bash
sudo apt-get install squid apache2 imagemagick
cp etc/apache2/sites-enabled/squid /etc/apache2/sites-enabled/000-squid
cp -r var/www/squid /var/www/

chown -R www-data:www-data /var/www/squid

# Add proxy to the www-data group and vice versa
usermod -aG www-data proxy
usermod -aG proxy www-data

# Restart apache
/etc/init.d/apache2 restart

