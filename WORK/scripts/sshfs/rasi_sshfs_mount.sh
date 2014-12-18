#!/bin/bash

if [ "$(pidof sshfs)" ] 
then
killall sshfs && echo "connection to host terminated" | dzen2 -p 4 -fn 'ProggyCleanTT' -fg '#00BBFF' -bg '#080808'
else
sshfs USER@HOST:DIR /path/to/mountpoint && echo "host filesystem mounted in MOUNTPOINT" | dzen2 -p 4 -fn 'ProggyCleanTT' -fg '#00BBFF' -bg '#080808'
fi
