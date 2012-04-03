#!/bin/bash
IMAGE_PATH=$1
IMAGE_URL=`echo "$2" | sed -e 's/ .*$//'`

echo " Flipping $IMAGE_URL for $2" >> /var/log/squid/transform-image.log

/usr/bin/wget -q -O $IMAGE_PATH $IMAGE_URL
if [ "$?" = "0" ]; then
    # Determine which effect we'll apply
    EFFECT_NUM=$((RANDOM%8+1));
    if [ $EFFECT_NUM = 1 ]; then
        EFFECT="-flip"
    elif [ $EFFECT_NUM = 2 ]; then
        EFFECT="-distort ScaleRotateTranslate 45"
    elif [ $EFFECT_NUM = 3 ]; then
        EFFECT="-wave 64x256"
    elif [ $EFFECT_NUM = 4 ]; then
        EFFECT="-vignette 64"
    elif [ $EFFECT_NUM = 5 ]; then
        EFFECT="-transverse"
    elif [ $EFFECT_NUM = 6 ]; then
        EFFECT="-solarize 25%"
    elif [ $EFFECT_NUM = 7 ]; then
        EFFECT="-swirl 150%"
    elif [ $EFFECT_NUM = 8 ]; then
        EFFECT="-shear 25%"
    fi

    /usr/bin/mogrify $EFFECT $IMAGE_PATH
    if [ $? = 0 ]; then
        exit 0;
    fi
fi

rm -f $IMAGE_PATH

exit 1;

