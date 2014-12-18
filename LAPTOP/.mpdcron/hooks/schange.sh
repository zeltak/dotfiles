#!/bin/sh

ARTIST=`mpc -f "%artist%" current | sed -e s/"&"/"&amp;"/`
ALBUM=`mpc -f "%album%" current | sed -e s/"&"/"&amp;"/`
TITLE=`mpc -f "%title%" current`



if [ "$ARTIST" != "" ] && [ "$ALBUM" != "" ]
    then
        LINETWO="
<b>"$ARTIST"

"$ALBUM"</b>"


elif [ "$ARTIST" != "" ] && [ "$ALBUM" == ""  ]
    then
        LINETWO="<b>"$ARTIST"</b>"


elif [ "$ARTIST" == "" ] && [ "$ALBUM" != ""  ]
    then
        LINETWO="<b>"$ALBUM"</b>"

else
        LINETWO=""
fi


notify-send "$TITLE" "$LINETWO" -u low -t 3000
