#!/bin/bash
 
 synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')&&  notify-send  -u low "Touchpad toggled"
