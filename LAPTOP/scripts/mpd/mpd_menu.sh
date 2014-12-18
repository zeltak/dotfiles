#!/bin/bash

#dmenu options
source ~/.config/teiler/config
DMENU="dmenu -i -l 20 -fn "$font" -nf "$nf" -nb "$nb" -sf "$sf" -sb "$sb" -p "Play:""

#dmenu option names
prog="
a.artist
b.track
c.album
d.playlist
--------------------
e.ran_off
f.ran_on
--------------------
z.Zfav
s.Sooth
--------------------
i.artist_info_amg
j.album_info_amg
k.track_lyrics
--------------------
"

#actual dmenu commands
cmd=$(dmenu -i -l 20 -fn "$font" -nf "$nf" -nb "$nb" -sf "$sf" -sb "$sb" -p 'select mpd option'  <<< "$prog")
case ${cmd%% *} in
	
	a.artist)	 mplay -a  ;;
	b.track)	 dplay -t  ;;
	c.album)	 dplay -a  ;;
	d.playlist)	 mplay -p    ;;
	e.ran_off)	 mpc random off   && notify-send -u low -t 1 'Mpd' 'Random mode OFF' ;;
	f.ran_on)  	 mpc random on    && notify-send -u low -t 1 'Mpd' 'Random mode ON' ;;
	z.Zfav)	 mpc clear; mpc load Z_Fav; mpc shuffle ; mpc play ;;
	s.Sooth)	  mpc clear; mpc load Sooth ; mpc shuffle ; mpc play ;;  
    i.artist_info_amg)	surfraw yubnub allmusic $(mpc current -f %artist%)   ;;
	j.album_info_amg)	surfraw yubnub allmusic $(mpc current -f %album%)   ;;
	k.track_lyrics)	    surfraw yubnub google  $(mpc current -f %title%)  $(mpc current -f %artist%)  lyrics  ;;

  	*)		exec "'${cmd}'"  ;;
esac
