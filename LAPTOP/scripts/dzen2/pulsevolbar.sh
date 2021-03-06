#!/bin/bash
#
# filename: pulsevolbar.sh
# Usage:
#      pulsevolbar.sh <increase/decrease/mute>
# 
#
#Customize this stuff
SECS="1"            # sleep $SECS
BG="#8E35EF"        # background colour of window
FG="#FFFF00"        # foreground colour of text/icon
BAR_FG="#F52887"    # foreground colour of volume bar
BAR_BG="#41A317"    # background colour of volume bar
HEIGHT="30"         # window height
WIDTH="250"         # window width
BAR_WIDTH="150"     # width of volume bar
ICON=~/.pulse/dzen_icons/vol-hi.xbm
FONT="-*-terminus-medium-r-*-*-14-*-*-*-*-*-*-*"
ICON_VOL=~/.icons/dzen_icons/vol-hi.xbm
ICON_VOL_MUTE=~/.icons/dzen_icons/vol-mute.xbm
ICON=$ICON_VOL
PULSE_MAX_VOL=65536

# No need to customize this variable
PIPE="/tmp/pulesvolpipe"

# Lets find the appropriate positioning for the volume bar
XRES=`xdpyinfo|grep 'dimensions:'|awk '{print $2}'|cut -dx -f1`
XPOS=$[$XRES / 2 - $WIDTH / 2]          # horizontal positioning
YRES=`xdpyinfo|grep 'dimensions:'|awk '{print $2}'|cut -dx -f2`
YPOS=$[$YRES * 4 / 5]          # vertical positioning

# Sets the desired volume
function set_volume()
{
	CURVOL=$1
	pactl set-sink-volume 0 $CURVOL
}

# Gets the current volume
function get_volume()
{
    MIXER=$(pacmd list-sinks 0 | grep -i "volume: 0:")
    echo $MIXER | cut -d ' ' -f 3 | cut -d '%' -f 1
}

# Get muted ? returns yes or no
function get_muted()
{
    MUTED=$(pacmd list-sinks 0 | grep muted | cut -d ' ' -f 2)
    echo $MUTED
}

VOL=$(get_volume)
CURVOL=$[$VOL * $PULSE_MAX_VOL / 100 ]
MUTE=$(get_muted)         # Reads mute state
if [[ $MUTE == "yes" ]]	# Sets the icon to mute_icon as the increase or decrease will not make speaker speak
then
    ICON=$ICON_VOL_MUTE
fi

if [[ $1 == "increase" ]]
then
    CURVOL=$(($CURVOL + 3277))	# 3277 is 5% of the total volume, you can change this to suit your needs.
    if [[ $CURVOL -ge $PULSE_MAX_VOL ]]
    then
        CURVOL=$PULSE_MAX_VOL        
    fi
    set_volume $CURVOL
elif [[ $1 == "decrease" ]]
then
    CURVOL=$(($CURVOL - 3277))
    if [[ $CURVOL -le 0 ]]
    then
        CURVOL=0        
    fi
    set_volume $CURVOL
elif [[ $1 == "mute" ]]
then
    if [[ $MUTE == "no" ]]
    then
        pactl set-sink-mute 0 1
	ICON=$ICON_VOL_MUTE
    else
        pactl set-sink-mute 0 0
	ICON=$ICON_VOL
    fi
fi

# showing in dzen2
if [ ! -e "$PIPE" ];
# if pipe file does not exists 
then
	mkfifo "$PIPE"
	(dzen2 -tw "$WIDTH" -h "$HEIGHT" -x "$XPOS" -y "$YPOS" -fn "$FONT" -bg "$BG" -fg "$FG" < "$PIPE" 
	rm  -f "$PIPE") &
fi

