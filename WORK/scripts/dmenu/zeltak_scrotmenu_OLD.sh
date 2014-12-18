#!/bin/bash
#changelog
#v0.5
#added clip uploading
#v0.4
#added screencast function
#v0.3
#added 1.dunst notifications 2.unique names for each type (for quick launch) 3.better photo editor (pinta) 4.dmenu title

IMG_PATH=/home/zeltak/ZH_tmp/
UL=fb
EDIT=pinta
RES=1600x900 #set your screen resolution
TIME=4  #How long will notifications be visible?



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

cmd=$(dmenu  -l 20  -fn 'Roboto-Bold-r-normal11*-iso8859-11'  -nf '#FFFFFF' -nb '#000000' -sf '#FFFFFF' -sb '#33B5E5'   -p 'Choose Screenshot Type'   <<< "$prog")

cd $IMG_PATH
case ${cmd%% *} in

    #for local screenshots
    
    1.quick_fullscreen)	scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png'  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen taken and saved'  ;;
	2.delayed_fullscreen)	~/bin/countdown 0 3 & scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png'  && notify-send -u low -t $TIME 'Scrot' 'Fullscreen Screenshot saved'    ;;
	3.section)	scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' && notify-send -u low -t $TIME 'Scrot' 'Screenshot of section saved'    ;;
	4.edit_fullscreen)	scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f"  && notify-send -u low -t $TIME 'Scrot' 'Screenshot edited and saved' ;;
	5.edit_section)	scrot -s'%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f"  && notify-send -u low -t $TIME 'Scrot' 'Screenshot edited and saved' ;;
    
    
    #for uploaded screenshots
     a.upload_fullscreen)	scrot -d 1 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f" && (xclip -o;echo) | xclip -selection clipboard  && notify-send -u low -t $TIME 'Scrot' 'Screenshot Uploaded (powered by FB)'  ;;
    u.upload_delayed_fullscreen)	~/bin/countdown 0 3 & scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f"  && (xclip -o;echo) | xclip -selection clipboard  && notify-send -u low -t $TIME 'Scrot' 'Screenshot Uploaded (powered by FB)'  ;;
	e.edit_upload_fullscreen)	~/bin/countdown 0 3 & scrot -d 4 '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f && $UL \$f && rm -f \$f"  && notify-send -u low -t $TIME 'Scrot' 'Screenshot Uploaded (powered by FB)'  ;;
	s.upload_section)	scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$UL \$f"  && (xclip -o;echo) | xclip -selection clipboard   &&  notify-send -u low -t $TIME 'Scrot' 'Screenshot taken and UPLOADED';;
    p.edit_upload_section)  scrot -s '%Y-%m-%d-@%H-%M-%S-scrot.png' -e "$EDIT \$f && $UL \$f && rm -f \$f"  && notify-send -u low -t $TIME 'Scrot' 'Screenshot Uploaded (powered by FB)'  ;;
   
    
    
    #for screencast 
    c.cast)  ffmpeg -r 25 -f x11grab -s $RES -i :0.0+0,0 -vcodec libx264 temp_cast.mkv  && notify-send -u low -t $TIME 'ffmpeg' 'started screencast'  ;;
    k.kill_cast)   kill $(pgrep -f x11grab)  && sleep 3  && $UL temp_cast.mkv && rm -f temp_cast.mkv && (xclip -o;echo) | xclip -selection clipboard && notify-send -u low -t $TIME 'ffmpeg' 'screencast uploaded)'  ;;
   
    
    #for clipboard uploads
 x.upload_clip) ~/bin/countdown 0 6 & sleep 7 && xclip -o | fb && (xclip -o;echo) | xclip -selection clipboard && notify-send -u low -t $TIME 'xclip' 'clipboard uploaded)'  ;;



  	*)		exec "'${cmd}'"  ;;
esac

