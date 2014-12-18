#!/bin/bash

TAGTOOL=/home/zeltak/bin/mpd_rating/rate_tool.sh   #path to actual tagging script
TAGTOOL2= /home/zeltak/bin/mpd_rating/delrate_tool.sh #path to tool to remove ratings

prog="
1_stars
2_stars
3_stars
4_stars
5_stars
0_remove_rating
"

cmd=$(dmenu  -l 20  -nf '#999' -nb '#000' -sf '#eee' -sb '#0077bb' -p 'Rating for playing song:'   <<< "$prog")

case ${cmd%% *} in

1_stars) $TAGTOOL 0.2 ;;
2_stars) $TAGTOOL 0.4 ;;
3_stars) $TAGTOOL 0.6 ;;
4_stars) $TAGTOOL 0.8 ;;
5_stars) $TAGTOOL 1.0 ;;
0_remove_rating) $TAGTOOL2;;
  	*)		exec "'${cmd}'"  ;;
esac

