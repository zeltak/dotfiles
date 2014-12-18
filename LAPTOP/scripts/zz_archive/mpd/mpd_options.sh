#!/bin/bash

prog="
playlist_Fav
-------------
random_off
random_on
-------------
now
que_album
-------------
"

cmd=$(dmenu -xs -b -i -l 12 -nb black -nf white -fn $font <<< "$prog")

case ${cmd%% *} in
	
	random_off)	exec mpc random off  ;;
	random_on)	exec mpc random on	;;
	que_album)		exec /home/zeltak/scripts/dmenu/mpd_multi_QUE.sh	;;
	now)	exec /home/zeltak/scripts/dmenu/mpd_multi_NOW.sh	;;
	playlist_Fav)   exec /home/zeltak/scripts/mpd/mpd_zfav.sh               ;;
  	*)		exec "'${cmd}'"  ;;
esac