Squid Image Replacer
====================

On the Server:
* cd ./server/
* Update ./etc/squid/squid.conf with your internal network range. Eg. 192.168.0.1/24
* sudo ./install.sh

On the Client:
* cd ./client/
* Update /etc/init/upsidedown.conf with the IP address of your Server
* sudo ./install.sh
