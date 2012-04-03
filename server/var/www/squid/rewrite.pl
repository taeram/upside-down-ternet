#!/usr/bin/perl
$ipAddress="192.168.0.130"
$baseImageDir="/var/www/squid";
$baseImageUrl="http://$ipAddress";
$|=1;
$count = 0;
$pid = $$;
while (<>) {
    chomp $_;
    $imageUrl="$_";
    $imagePath="";
    if ($_ =~ /(imgres)/i) { 
        # Do nothing for Google Image redirect urls
    } elsif ($_ =~ /(.*\.swf)/i) {
       # Do nothing for swf files
    } elsif ($_ =~ /(.*\.jpg)/i) {
#       $imagePath="/tmp/$pid-$count.jpg"; # Transform
       $imageUrl="default.jpg"; # Use Default
    } elsif ($_ =~ /(.*\.gif)/i) {
#        $imagePath="/tmp/$pid-$count.gif"; # Transform
        $imageUrl="default.gif"; # Use Default
    } elsif ($_ =~ /(.*\.png)/i) {
        $imagePath="tmp/$pid-$count.png"; # Transform
    }

    if ($imagePath eq "") {
        print "$baseImageUrl/$imageUrl\n";;
    } else {
	system("$baseImageDir/transform-image.sh", "$baseImageDir/$imagePath", "$_");
	if ($? eq 0) {
	    print "$baseImageUrl/$imagePath\n";;
	} else {
            print "$_\n";;
	}
    }

    $count++;
}
