#!/bin/bash

prog="
sleep
-------------
"

cmd=$(dmenu -l 15  <<< "$prog")

case ${cmd%% *} in
		
        sleep)	exec sudo s2ram -f   ;;
  	*)		exec "'${cmd}'"  ;;
esac
