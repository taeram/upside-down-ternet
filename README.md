Upside-Down-ternet
====================

An Ubuntu-compatible version of Upside-Down-ternet: http://www.ex-parrot.com/~pete/upside-down-ternet.html

On the Server:

* cd ./server/
* Update ./etc/squid/squid.conf with your internal network range. Eg. 192.168.0.1/24
* Update ./var/www/squid/rewrite.pl with your server's IP address. Eg. 192.168.0.130
* sudo ./install.sh

On the Client:

* cd ./client/
* Update /etc/init/upsidedown.conf with the IP address of your Server
* sudo ./install.sh
