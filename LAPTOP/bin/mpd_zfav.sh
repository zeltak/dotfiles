#!/bin/sh
mpc clear; mpc load Z_Fav; mpc shuffle ; mpc play  && notify-send -u low -t 1 'MPD' 'Z1 playlist loaded' ;

