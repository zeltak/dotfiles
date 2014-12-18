#!/bin/bash

prog="
connect-home
connect-home-stop
connect-home-restart
-------------
connect-uni
connect-uni-down
connect-uni-restart
-------------
wifi_selector
------------
"

cmd=$(dmenu -l 15  <<< "$prog")

case ${cmd%% *} in
	
	connect-home)	exec sudo netcfg zn   ;;
	connect-home-restart)	exec sudo netcfg down zn && sudo netcfg zn   ;;
	connect-home-stop)	exec sudo netcfg down zn  ;;
	connect-uni)	exec sudo netcfg zn   ;;
	connect-uni-restart)	exec sudo netcfg down zn  && sudo netcfg zn   ;;
	connect-uni-stop)	exec sudo netcfg down zn:  ;;
        wifi_selector)	exec urxvt -e  sudo wifi-select wlan0   ;;
  	*)		exec "'${cmd}'"  ;;
esac
