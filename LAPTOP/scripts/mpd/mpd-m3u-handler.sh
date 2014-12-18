#!/bin/sh
# Add this to beets config:
# play:
#   command: mpd-m3u-handler.sh
#
test $# -ne 1 && echo "$0 takes 1 argument" && exit 1
test ! -e "$1" && echo "Argument ($1) needs to be a file" && exit 2
music="/home/zeltak/music/"
mpc clear

# Strip music's base directory
cat $1 | while read line; do
	mpc add "${line/$music/}"
done

mpc play
