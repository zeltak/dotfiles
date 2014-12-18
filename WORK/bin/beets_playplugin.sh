#!/bin/sh
#
# Make sure you set your relative_to path in beets' config.
# For example:
#
#   play:
#     relative_to: /mnt/media/music/
#     command: mpc-beets-play.sh
#

test $# -ne 1 && echo "$0 takes 1 argument" && exit 1
test ! -e "$1" && echo "Argument ($1) needs to be a file" && exit 2

mpc clear
cat $1 | mpc add
mpc play