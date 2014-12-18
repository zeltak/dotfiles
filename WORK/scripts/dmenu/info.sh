#!/bin/bash

prog="
alias
netcfg
-------------
"

cmd=$(dmenu -l 15  <<< "$prog")

case ${cmd%% *} in
		
        alias)	exec /home/zeltak/scripts/xosd/alias.sh   ;;
        sleep)	exec sudo s2ram -f   ;;
        sleep)	exec sudo s2ram -f   ;;
        sleep)	exec sudo s2ram -f   ;;
  	*)		exec "'${cmd}'"  ;;
esac
