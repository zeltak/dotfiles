#!/bin/bash

dmenu_opts='-xs -b -i -l 15 -fn $font'
# file contains $format and $dmenu_opts
. $XDG_CONFIG_HOME/muzak

select=$(mpc --format "$format" listall | dmenu $dmenu_opts -p "select song")
if [[ -n "$select" ]]; then
	mpc add "$select"
	n="$(mpc | head -n 2 | tail -n 1 | gawk -F'[#/ ]' '{print $4,$3+1}')"
	mpc move $n
fi


#itai added this line to kill random when executed

mpc random off