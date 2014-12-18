#!/bin/bash

playing="$(mpc current -f "[%artist% - ]%title% (%date%)")"
if [[ -z $playing ]]; then
    playing=" ◼ Stopped"
    echo $playing
else
    status="►"
    mpc | grep "\[paused\]" 1>/dev/null && status="▷"
    playing="$status $playing"
    echo $playing
fi
