####Autostart####

exec xrandr --output LVDS1 --primary &

sleep 10 &

#services
#exec xbindkeys  & 
#exec xchainkeys   &

#for sxhkd hotkey deamon
#exec sxhkd_notify /home/zeltak/.config/sxhkd/sxhkd_socket &
#exec sxhkd -s /home/zeltak/.config/sxhkd/sxhkd_socket &
exec sxhkd &
#exec clipit &
exec gpaste applet &
exec xcmenu  &
#mpd related
exec mpdcron   &
exec mpdscribble &
#exec remmina -i &
exec worker &
exec firefox &
exec cantata &
#for weechat notifications
#exec python2 /home/zeltak/bin/weechat-remote-notify.py 4321 &
#exec python2 /home/zeltak/bin/weechat-remote-notify.py 20000 &
#exec /home/zeltak/bin/notify-client.sh & 

##compositor
exec compton &
#exec dropboxd &
#exec sparkleshare start &
##disable trackpad
exec /home/zeltak/bin/trackpad-toggle.sh &

##keyboard settings
exec setxkbmap -option compose:ralt&
exec tmux_focus &
exec nm-applet &
exec pasystray &

#exec loliclip &
#exec autokey-gtk &
#exec /home/zeltak/.screenlayout/zbase.sh &
####OLD####
#exec parcellite &
#exec gmailchecker &
#exec kupfer &
#exec telescope &
#exec synapse &


##########################################################################3
##########################################################################3
##########################################################################3
#WORKSPACES


#WORKSPACE #2 (Terms) 

#exec urxvt -name tmux_terms -e tmux_terms &
#exec termite -r tmux_terms -e tmux_terms &
#terminator --classname=main_term &

#WORKSPACE #3 (browsers)
#exec chromium   &
#exec firefox   &
#exec dwb   &
#exec keepassx /home/zeltak/Dropbox/multisync/keepass/Zpass2013.kdbx   &
#exec keepass &

#WORKSPACE #4 (multimedia)
#exec urxvt -name tmux_mpd -e tmux_mpd  &
#exec termite --role=tmux_mpd -e tmux_mpd &


#WORKSPACE #5 (skype/pulse)
#exec skype   &
#exec pavucontrol &

#WORKSPACE #6 (FM)
#exec spacefm -d   &
#exec spacefm    &
#doublecmd &

#WORKSPACE #7 (ssh)
#exec ssh_karif &

#WORKSPACE #8 (Notecase)
#exec notecase   &
#exec /home/zeltak/bin/elauncher.sh  &
#exec emacsclient -c -e '(x-change-window-property "WM_CLASS" "org\0org" nil nil nil t)' &

#WORKSPACE #9 (Editor)
#exec gvim   &
#exec emacsclient -nc &

#exec emacsclient -c -e '(x-change-window-property "WM_CLASS" "emacs" nil nil nil t)' &

#WORKSPACE #10 (Productivity)

#exec /home/zeltak/bin/todo_org.sh  &

#WORKSPACE #11 (Utils)
#exec urxvt -name tmux_utils -e tmux_utils &
#exec termite -r tmux_utils -e tmux_utils &
#exec terminator --classname=tmux_utils -e tmux_utils &

#WORKSPACE #12  (VM/Remote access)

#WORKSPACE #13   (graphics)

#WORKSPACE #14   (office)
#exec urxvt -name tmux_office -e tmux_office  &
#xec termite -r tmux_office -e tmux_office &


##########################################################################3
##########################################################################3
##########################################################################3

#launch panel
#exec xfce4-panel --disable-wm-check &

