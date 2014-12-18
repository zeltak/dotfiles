#!/bin/bash

prog="
power
network
mdd
info
heb
eng
"

cmd=$(dmenu -l 12  -nb '#EEEEEE' -nf '#777777' -sb '#F92672'  -fn 'xft:Envy:size=12'   <<< "$prog")

case ${cmd%% *} in

	power)	       exec /home/zeltak/bin/power_menu.sh  ;;
	network)	exec /home/zeltak/bin/network_menu.sh   ;;
	mpd)	  exec       /home/zeltak/bin/zmpd.sh:;;
	info)	  exec       /home/zeltak/bin/info.sh:;;
	heb)	  exec      /home/zeltak/scripts/local/hebrew.sh ;;
	eng)	  exec      /home/zeltak/scripts/local/english.sh;;
  	*)		exec "'${cmd}'"  ;;
esac
