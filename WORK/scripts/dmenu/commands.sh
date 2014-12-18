#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
  . $HOME/.dmenurc
else
  DMENU='dmenu -i'
fi



prog="
ssaver_on
blank_off
"

cmd=$($DMENU -l 12 -p 'Choose cheatsheet'  <<< "$prog")

case ${cmd%% *} in

	ssaver_on)	        exec  xset s on   ;;
	blank_off)	exec    xset s off -dpms  ;;
	mpd)	  exec       feh /home/zeltak/MLT/cheatsheets/ranger.png ;;
	rtorrent)	  exec  feh /home/zeltak/MLT/cheatsheets/rtorrent.png      ;;
	heb)	  exec      /home/zeltak/scripts/local/hebrew.sh ;;
	eng)	  exec      /home/zeltak/scripts/local/english.sh;;
  	*)		exec "'${cmd}'"  ;;
esac
