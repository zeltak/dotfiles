#!/bin/bash
#
case $1 in
volup) a="Volume: `amixer sset PCM 2%+ unmute | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $5 }'`%" ;;
voldown) a="Volume: `amixer sset PCM 2%- unmute | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $5 }'`%" ;;
next) a="Next: `mpc next|head -1`";;
prev) a="Previous: `mpc prev|head -1`";;
np) a="np: `mpc|head -1`";;

mute)
case `amixer set PCM toggle | grep Left: | awk '{ gsub(/\[/, " "); gsub(/%\]/, " "); print $7 }' | cut -f1 -d]` in
            on) a="Unmute" ;;
             *) a="Mute" ;;
             esac ;;
*) echo "Usage: $0 { up | down | mute }"  ;;
esac

killall aosd_cat &> /dev/null
echo "$a" |  aosd_cat --fore-color=white --font="bitstream bold 20" -p 7 --x-offset=-10 --y-offset=-30 --transparency=1 --fade-full=2500
