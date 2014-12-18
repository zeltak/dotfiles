#!/bin/bash

prog="
ranger
subtle
mpd
rtorrent
vim
penta
task
yaourt
fim
bash 
"

cmd=$(dmenu -i -fn "Envy Code R" -nb "#080808" -nf "#00bbff" -sb "#3c3c3c" -sf "#FECF35" -l 12 -p 'Choose cheatsheet'  <<< "$prog")

case ${cmd%% *} in

	ranger)	        exec  feh /home/zeltak/MLT/cheatsheets/ranger.png  ;;
	subtle)	exec feh /home/zeltak/MLT/cheatsheets/subtle.png  ;;
	mpd)	  exec       feh /home/zeltak/MLT/cheatsheets/ranger.png ;;
	rtorrent)	  exec  feh /home/zeltak/MLT/cheatsheets/rtorrent.png      ;;
	vim)	  exec  feh /home/zeltak/MLT/cheatsheets/vim.png      ;;
	penta)	  exec  feh /home/zeltak/MLT/cheatsheets/penta.png      ;;
	task)	  exec  feh /home/zeltak/MLT/cheatsheets/task.png      ;;
	yaourt)	  exec  feh /home/zeltak/MLT/cheatsheets/clyde.png      ;;	
	fim)	  exec  feh /home/zeltak/MLT/cheatsheets/vim2.png      ;;
	bash)	  exec  feh /home/zeltak/MLT/cheatsheets/bash.png      ;;
  	*)		exec "'${cmd}'"  ;;
esac
