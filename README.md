Upside-Down-ternet
====================

An Ubuntu-compatible version of Upside-Down-ternet: http://www.ex-parrot.com/~pete/upside-down-ternet.html

Required:

* A server running Ubuntu

On the Server:

* cd ./server/
* nano ./etc/squid/squid.conf # Update with your internal network range. Eg. 192.168.0.1/24
* nano ./var/www/squid/rewrite.pl # Update with your server's IP address. Eg. 192.168.0.130
* sudo ./install.sh

On an Ubuntu Client:

* cd ./client/
* nano ./etc/init/upsidedown.conf # Update with the IP address of your Server
* sudo ./install.sh

On a client running Firefox, Chrome, Internet Explorer, Safari, etc.:

* Open the Proxy setup in the browser
* Set the proxy IP address to your server's IP address. Eg. 192.168.0.130
* Set the proxy port to 3128 (which is squid on your server)
