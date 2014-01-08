Upside-Down-ternet
====================

An Ubuntu-compatible version of Upside-Down-ternet: http://www.ex-parrot.com/~pete/upside-down-ternet.html

![youtube](http://taeram.github.io/media/upside-down-ternet_youtube.jpg)

This version is intended to be run as a server on a LAN and to have some, but not all clients redirected to it. Perfect for April Fools' day.

Required:

* A server running Ubuntu
* A client running Ubuntu, or
* A client with a customizable web browser installed (Eg. Firefox, Chrome, Internet Explorer, Safari)

On the Server:

    # Check it out!
    git clone git@github.com:taeram/upside-down-ternet.git
    cd ./upside-down-ternet/server/

    # Update the rewrite script with your server's IP address. Eg. 192.168.0.130
    nano ./var/www/squid/rewrite.pl 

    # Install all the things!
    sudo ./install.sh

    # Update the squid config
    nano /etc/squid/squid.conf
    
        # Add this after: http_access allow localhost
        http_access allow localnet
    
        # Modify http_port
        http_port 3128 transparent

        # Add the url rewrite program
        url_rewrite_program /var/www/squid/rewrite.pl
    
    restart squid

On an Ubuntu Client:

    # Check it out!
    git clone git@github.com:taeram/upside-down-ternet.git
    cd ./upside-down-ternet/client/

    # Update the init script with the IP address of your Server
    nano ./etc/init/upsidedown.conf

    # Install all the things!
    sudo ./install.sh

On a client running Firefox, Chrome, Internet Explorer, Safari, etc.:

* Open the Proxy setup in the browser
* Set the proxy IP address to your server's IP address. Eg. 192.168.0.130
* Set the proxy port to 3128 (which is squid on your server)
