#!/bin/sh
mpc clear; mpc load Sooth; mpc shuffle ; mpc play  && echo "Sooth loaded" && notify-send -u critical -i "/home/zeltak/MLT/programs/worker/Arch.png" 'MPD' 'Z1 playlist loaded' ;
