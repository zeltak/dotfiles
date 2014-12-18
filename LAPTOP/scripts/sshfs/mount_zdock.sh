#!/bin/bash

if [ "$(pidof sshfs)" ] 
then
killall sshfs && echo "connection to host terminated" | dzen2 -p 4 -fn 'ProggyCleanTT' -fg '#00BBFF' -bg '#080808'
else
sshfs zeltak@192.168.0.20:/media/tomb /media/zdock/ && echo "host filesystem mounted in MOUNTPOINT" | dzen2 -p 4 -fn 'ProggyCleanTT' -fg '#00BBFF' -bg '#080808'
fi
