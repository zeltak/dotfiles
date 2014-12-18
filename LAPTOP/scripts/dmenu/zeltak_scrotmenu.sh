#!/bin/bash
# teiler - A script to share (german word: teilen) screenshots/casts for tiling WMs - Pun intended
# (c) Rasmus Steinke <rasi at xssn dot at> 
# Additional Ideas, testing and some code by Zeltak <zeltak at gmail dot com>
#
# Requirements:
# xclip, fb-client, pinta, dzen2, dmenu, ffmpeg, scrot, bc, some notification daemon


#changelog
#v0.8
#Put notify-send into its own function, Made delay being calculated from counter value.
#v0.7
#Massive Code Cleanup
#v0.6
#Countdown script stolen from Google and integrated.
#v0.5
#added clip uploading
#v0.4
#added screencast function
#v0.3
#added 1.notifications 2.unique names for each type (for quick launch) 3.better photo editor (pinta) 4.dmenu title


############### Configuration options ##############################

IMG_PATH=/home/zeltak/ZH_tmp/
FILEMASK=%Y-%m-%d-@%H-%M-%S-scrot.png
UL=fb
EDIT=pinta
RES=1600x900   #set your screen resolution
TIME=4          #How long will notifications be visible?
TOTSECS1=3      #Seconds to count for delay (Use $COUNTD variable)
TOTSECS2=6      #Seconds to count for delay (Use $COUNTD2 variable)


#DMENU/DZEN2 CONFIGURATION
FONT="Roboto-Bold-r-normal11*-iso8859-11"
#FONT="Envy Code R-9"
NF="#FFFFFF"
NB="#000000"
SF="#FFFFFF"
SB="#33B5E5"
DZEN2_W=100  #Width of dzen2
DZEN2_X=550  #X Padding



################## Configuration End ##############################


# Needed for the countdown
# Based on some script by  Marco Fontani - MFONTANI at cpan dot org
set -bm
COLOR='#7c7c72'
function countdown () {
    seq 1 ${1:-10} | tac | \
        perl -ne'BEGIN{$|++;$msg=shift}$m=int($_/60);$s=int($_-$m*60);printf("$m:%02d -- $msg\n",$s);sleep 1;' \
        "${2:-ready...}"
}


# Outsource the notfiy-send to its own function to clean up the mess below a bit ;)
function notify() {
  notify-send -u low -t ${1} "Scrot" "${2}"
}

####Some Variables to clean up the code a bit
COUNTD="countdown $COUNTER1 GO | dzen2 -fn \"$FONT\" -fg \"$NF\" -ta c -w \"$DZEN2_W\" -bg \"$NB\" -x \"$DZEN2_X\""
COUNTD2="countdown $COUNTER2 GO | dzen2 -fn \"$FONT\" -fg \"$NF\" -ta c -w \"$DZEN2_W\" -bg \"$NB\" -x \"$DZEN2_X\""
XCLIP="(xclip -o;echo) | xclip -selection clipboard"



prog="
---Local screenshots (saved at IMG_PATH)---
1.quick_fullscreen
2.delayed_fullscreen
3.section
4.edit_fullscreen
5.edit_section
---Upload to remote service (images will be deleted)---
a.upload_fullscreen
u.upload_delayed_fullscreen
e.edit_upload_fullscreen
s.upload_section
p.edit_upload_section
---Screencasts
c.cast
k.kill_cast
---Clipboard
x.upload_clip
"


cmd=$(dmenu -l 20 -fn "$FONT" -nf $NF -nb $NB -sf $SF -sb $SB -p 'Choose Screenshot Type'   <<< "$prog")

cd $IMG_PATH
case ${cmd%% *} in

    #for local screenshots
    1.quick_fullscreen)             scrot -d 1 "$FILEMASK" && notify ${TIME} "Screenshot saved"  ;;
    2.delayed_fullscreen)           eval $COUNTD & scrot -d $(echo $COUNTER1+1 | bc) "$FILEMASK" && notify ${TIME} "Screenshot saved"     ;;
    3.section)                      scrot -s "$FILEMASK" && notify ${TIME} "Screenshot saved"    ;;
    4.edit_fullscreen)              scrot -d 1 "$FILEMASK" -e "$EDIT \$f" && notify ${TIME} "Screenshot edited and saved" ;;
    5.edit_section)                 scrot -s "$FILEMASK" -e "$EDIT \$f" && notify ${TIME} "Screenshot edited and saved"  ;;

    #for remote uploads
    a.upload_fullscreen)            scrot -d 1 "$FILEMASK" -e "$UL \$f" && eval $XCLIP && notify ${TIME} "Screenshot uploaded"  ;;
    u.upload_delayed_fullscreen)    eval $COUNTD & scrot -d $(echo $COUNTER1+1 | bc) "$FILEMASK" -e "$UL \$f && rm -f \$f" && eval $XCLIP && notify ${TIME} "Screenshot uploaded"  ;;
    e.edit_upload_fullscreen)       scrot -d 1 "$FILEMASK" -e "$EDIT \$f && $UL \$f && rm -f \$f" && eval $XCLIP && notify ${TIME} "Screenshot uploaded"  ;;
    s.upload_section)               scrot -s "$FILEMASK" -e "$UL \$f && rm -f \$f" && eval $XCLIP && notify ${TIME} "Screenshot uploaded"  ;;
    p.edit_upload_section)          scrot -s "$FILEMASK" -e "$EDIT \$f && $UL \$f && rm -f \$f" && eval $XCLIP && notify ${TIME} "Screenshot uploaded"  ;;

    #for screencasts
    c.cast)                         ffmpeg -r 25 -f x11grab -s $RES -i :0.0+0,0 -vcodec libx264 temp_cast.mkv && notify ${TIME} "Screencast started"  ;;
    k.kill_cast)                    kill $(pgrep -f x11grab) && sleep 3 && $UL temp_cast.mkv && rm -f temp_cast.mkv && eval $XCLIP && notify ${TIME} "Screencast uploaded"  ;;

    #for clipboard content
    x.upload_clip)                  eval $COUNTD2 & sleep $(echo $COUNTER2+1 | bc) && xclip -o | fb && eval $XCLIP && notify ${TIME} "Clipboard uploaded"
;;

	*)		exec "'${cmd}'"  ;;
esac
