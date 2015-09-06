#!/bin/bash

current=$(mpc save temp)
#either have amenu to choose or specify a direct playlist
#pl="$(mpc lsplaylists | rofi -dmenu)"
pl="clerk"
mpc clear
mpc load "${pl}"
list=$(mpc playlist -f '%artist% - %album% - %date%' | sort -u | rofi -dmenu)

mpc clear
mpc load temp
mpc search artist "$(echo $list | awk -F ' - ' '{print $1}')" album "$(echo $list | awk -F ' - ' '{print $2}')" date "$(echo $list | awk -F ' - ' '{print $3}')" | mpc add
mpc rm temp
