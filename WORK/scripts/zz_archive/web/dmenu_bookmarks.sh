#!/bin/bash

#NOTE: it's the job of the script that inserts bookmarks to make sure there are no dupes.

file=${XDG_DATA_HOME:-$HOME/.local/share}/uzbl/bookmarks
[ -r "$file" ] || exit
COLORS=" -nb #303030 -nf khaki -sb #CCFFAA -sf #303030"
DMENU="dmenu -i"
TAG=`cat $file | awk '{print $2}' | sort -u | $DMENU -nb \#303030 -nf khaki -sb \#CCFFAA -sf \#303030`
goto=`grep $TAG $file | awk '{print $1}' | $DMENU $COLORS`
[ -n "$goto" ] && echo "uri $goto" | socat - unix-connect:$5



