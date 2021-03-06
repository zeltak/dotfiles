#!/bin/bash
# This script adjusts the volume and launches popups with NotificaThor.
# usage:
#  volume up   - Raise volume by one step.
#  volume down - Lower volume by one step.
#  volume mute - Toggle MUTE


case $1 in
	"up")
		val="1+ on"
		;;
	"down")
		val="1- on"
		;;
	"mute")
		onoff=$(amixer sget Master | sed -n "s/.*\[\(on\|off\)\].*/\1/p")
		if [ "$onoff" = "on" ]; then
			amixer sset Master off > /dev/null
			thor-cli -b0/1 -i"/usr/share/icons/gnome/256x256/status/audio-volume-muted.png" -m"Mute"
			exit 0
		else
			val="on"
		fi
		;;
esac

ms=$(amixer sset Master $val)
percent=$(echo $ms | sed -n "s/.*\[\(.*\)%\].*/\1/p")
db=$(echo $ms | sed -n "s/.*\[\(.*dB\)\].*/\1/p")

if [ $percent -eq 0 ]; then
	image="/usr/share/icons/gnome/256x256/status/audio-volume-muted.png"
elif [ $percent -lt 33 ]; then
	image="/usr/share/icons/gnome/256x256/status/audio-volume-low.png"
elif [ $percent -lt 66 ]; then
	image="/usr/share/icons/gnome/256x256/status/audio-volume-medium.png"
else
	image="/usr/share/icons/gnome/256x256/status/audio-volume-high.png"
fi

thor-cli -i"$image"  -b"$percent"/100 -m"$db"
