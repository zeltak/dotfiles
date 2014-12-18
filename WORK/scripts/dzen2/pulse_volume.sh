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
XPOS="705"          # horizontal positioning
YPOS="800"          # vertical positioning
HEIGHT="30"         # window height
WIDTH="250"         # window width
BAR_WIDTH="150"     # width of volume bar
ICON=~/.pulse/dzen_icons/vol-hi.xbm
FONT="fixed"
ICON_VOL=~/.pulse/dzen_icons/vol-hi.xbm
ICON_VOL_MUTE=~/.pulse/dzen_icons/vol-mute.xbm
ICON=$ICON_VOL

# No need to customize this variable
PIPE="/tmp/pulesvolpipe"

set_volume()
{
    CURVOL=$1
    pactl set-sink-volume 0 $CURVOL
    echo $CURVOL > ~/.pulse/volume # Write the new volume to disk to be read the next time the script is run.
}

#### Create ~/.pulse/mute if not exists
ls ~/.pulse/mute &> /dev/null
if [[ $? != 0 ]]
then
    echo "false" > ~/.pulse/mute
fi

####Create ~/.pulse/volume if not exists
ls ~/.pulse/volume &> /dev/null
if [[ $? != 0 ]]
then
    echo "65536" > ~/.pulse/volume
fi

CURVOL=`cat ~/.pulse/volume`     # Reads in the current volume
MUTE=`cat ~/.pulse/mute`          # Reads mute state
if [[ $MUTE == "true" ]]    # Sets the icon to mute_icon as the increase or decrease will not make speaker speak
then
    ICON=$ICON_VOL_MUTE
fi

if [[ $1 == "increase" ]]
then
    CURVOL=$(($CURVOL + 3277))    # 3277 is 5% of the total volume, you can change this to suit your needs.
    if [[ $CURVOL -ge 65536 ]]
    then
        CURVOL=65536        
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
    if [[ $MUTE == "false" ]]
    then
        pactl set-sink-mute 0 1
        echo "true" > ~/.pulse/mute
    ICON=$ICON_VOL_MUTE
    else
        pactl set-sink-mute 0 0
        echo "false" > ~/.pulse/mute    
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

# feed the pipe
(echo $[$CURVOL *  100 / 65536]| dzen2  -l "^i(${ICON})" -fg "$BAR_FG" -bg "$BAR_BG" -w "$BAR_WIDTH"  ; sleep "$SECS" ) > "$PIPE"
