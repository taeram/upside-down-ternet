Upside-Down-ternet
====================

An Ubuntu-compatible version of Upside-Down-ternet: http://www.ex-parrot.com/~pete/upside-down-ternet.html

Required:

* A server running Ubuntu
* A client running Ubuntu, or
* A client with a customizable web browser installed (Eg. Firefox, Chrome, Internet Explorer, Safari)

On the Server:

    # Check it out!
    git clone git@github.com:taeram/upside-down-ternet.git
    cd upside-down-ternet/server/

    # Update the squid config with your internal network range. Eg. 192.168.0.1/24
    nano ./etc/squid/squid.conf 

    # Update the rewrite script with your server's IP address. Eg. 192.168.0.130
    nano ./var/www/squid/rewrite.pl 

    # Install all the things!
    sudo ./install.sh

On an Ubuntu Client:

    # Check it out!
    git clone git@github.com:taeram/upside-down-ternet.git
    cd ./client/

    # Update the init script with the IP address of your Server
    nano ./etc/init/upsidedown.conf

    # Install all the things!
    sudo ./install.sh

On a client running Firefox, Chrome, Internet Explorer, Safari, etc.:

* Open the Proxy setup in the browser
* Set the proxy IP address to your server's IP address. Eg. 192.168.0.130
* Set the proxy port to 3128 (which is squid on your server)
