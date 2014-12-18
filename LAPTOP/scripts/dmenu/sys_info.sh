#!/bin/bash

prog="
autokey_info
bash_aliases
Meta-keys
Alt-keys
notecase
"

cmd=$(dmenu -xs -b -i -l 12 -nb green -nf black -fn $font <<< "$prog")

case ${cmd%% *} in
	
	autokey_info)	exec /home/zeltak/scripts/xosd/autokey.sh  ;;
	bash_aliases)	exec /home/zeltak/scripts/xosd/alias.sh	;;
	Meta-keys)	exec /home/zeltak/scripts/xosd/meta-keys.sh	;;
	notecase)	exec /home/zeltak/scripts/xosd/	;;
	Alt-keys)       exec /home/zeltak/scripts/xosd/               ;;
  	*)		exec "'${cmd}'"  ;;
esac