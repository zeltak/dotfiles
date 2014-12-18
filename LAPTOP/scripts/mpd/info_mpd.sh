#!/bin/bash

MPDARTIST=$(mpc current -f %artist%)  #path to actual tagging script
TAGTOOL2= /home/zeltak/scripts/mpd/rating/delrate_tool.sh #path to tool to remove ratings

prog="
1.artist_info_amg
2.album_info_amg
3.track_lyrics

4
5
0
"

cmd=$(dmenu -i -fn "Envy Code R" -nb "#080808" -nf "#00bbff" -sb "#3c3c3c" -sf "#FECF35" -l 12 -p 'select mpd option'  <<< "$prog")
case ${cmd%% *} in
	
	1.artist_info_amg)	exec surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
	2.album_info_amg)	exec surfraw yubnub allmusic $(mpc current -f %album%)   ;;
	3.track_lyrics)	exec  surfraw yubnub google  $(mpc current -f %title%)  $(mpc current -f %artist%)  lyrics  ;;
	1.artist_info)	exec surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
	1.artist_info)	exec surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
	1.artist_info)	exec surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
	1.artist_info)	exec surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
  	*)		exec "'${cmd}'"  ;;
esac
