#!/bin/bash
[[ -z $DISPLAY ]] && exit 1;
exec 0<&-
#for ssh
sup ssh zeltak@karif.server-speed.net 'socat unix-connect:notify.sock stdout' |
while read heading message; do
if [[ -n $heading ]]; then
#notify-send -t 5000 -- "${heading}" "${message}";
for dunst
notify-send -h string:bgcolor:#B90086 -h string:fgcolor:#ffffff -t 5000 -- "${heading}" "${message}";
fi
done 
