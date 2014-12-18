#!/bin/bash

prog="
base
folds
tabs_buffers
base
bash
"

cmd=$(dmenu -i -fn "Envy Code R" -nb "#080808" -nf "#00bbff" -sb "#3c3c3c" -sf "#FECF35" -l 12 -p 'Choose cheatsheet'  <<< "$prog")

case ${cmd%% *} in

	base)	  exec  feh /home/zeltak/MLT/cheatsheets/vim.png      ;;
	folds)	  exec  feh /home/zeltak/MLT/cheatsheets/vim_folds.png      ;;
	tabs_buffers)	  exec  feh /home/zeltak/MLT/cheatsheets/vim_tabbuff.png      ;;
	copy_paste)	  exec  feh /home/zeltak/MLT/cheatsheets/vim.png      ;;
	plugins)	  exec  feh /home/zeltak/MLT/cheatsheets/vim_folds.png      ;;
	folds)	  exec  feh /home/zeltak/MLT/cheatsheets/vim_folds.png      ;;
	bash)	  exec  feh /home/zeltak/MLT/cheatsheets/bash.png      ;;
  	*)		exec "'${cmd}'"  ;;
esac
