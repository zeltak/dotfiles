#!/bin/bash

TAGTOOL=/home/zeltak/scripts/mpd/rating/rate_tool.sh   #path to actual tagging script
TAGTOOL2= /home/zeltak/scripts/mpd/rating/delrate_tool.sh #path to tool to remove ratings

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

1_stars
2_stars
3_stars
4_stars
5_stars
0_remove_rating
) $TAGTOOL 0.2;;
	) $TAGTOOL 0.4;;
	) $TAGTOOL 0.6;;
	) $TAGTOOL 0.8;;
	) $TAGTOOL 1.0;;
        remove_rating) $TAGTOOL2;;
  	*)		exec "'${cmd}'"  ;;
esac
