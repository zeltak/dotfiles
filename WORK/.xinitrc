#!/bin/sh

/home/zeltak/bin/autostart.sh &

xrdb -load ~/.Xdefaults &

#To activate your custom table when starting Xorg
# if [ -f $HOME/.Xmodmap ]; then
#     /usr/bin/xmodmap $HOME/.Xmodmap
# fi

##$NOTE$: #for xinit you need to use $1 / with startx $2

#for xinit startups
#
# if [[ $1 == "e" ]]
# then
#   exec enlightenment_start
# elif [[ $1 == "s" ]]
# then
#   exec  subtle 
#elif [[ $1 == "kde" ]]
# then
#   exec ck-launch-session startkde 
# else
#   exec startfluxbox
# fi
#$1
#then you start X with xinit or xinit gnome xinit will start subtle 


##for Startx startups

#  if [[ $2 == "e" ]]
#  then
#    exec enlightenment_start
#  elif [[ $2 == "h" ]]
#  then
#    exec  herbstluftwm
#  elif [[ $2 == "f" ]]
#  then
#    exec fluxbox 
#  elif [[ $2 == "s" ]]
#  then
#    exec  subtle
#  elif [[ $2 == "a" ]]
#  then
#    exec  awesome
# elif [[ $2 == "i" ]]
#  then
#    exec  i3 --shmlog-size=26214400   
#  elif [[ $2 == "g" ]]
#  then
#     exec gnome-session
#  else
#    exec xinit /usr/bin/startkde
#  fi
# $2

exec i3



