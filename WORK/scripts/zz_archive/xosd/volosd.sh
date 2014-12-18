#!/bin/bash

case $1 in
up) a="Volume: `amixer sset PCM 2%+ unmute | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $5 }'`%" ;;
down) a="Volume: `amixer sset PCM 2%- unmute | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $5 }'`%" ;;
mute)
case `amixer set PCM toggle | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $7 }' | cut -f1 -d]` in
            on) a="Unmute" ;;
             *) a="Mute" ;;
             esac ;;
*) echo "Usage: $0 { up | down | mute }"  ;;
esac

killall aosd_cat &> /dev/null
echo "$a" |  aosd_cat  -p 7 --x-offset=-10 -
