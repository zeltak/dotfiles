#!/bin/sh
xprop -root _NET_CURRENT_DESKTOP \
                 _NET_NUMBER_OF_DESKTOPS \
                 _NET_DESKTOP_NAMES | \
    awk '
      /_NET_CURRENT_DESKTOP/ { current = $3 + 1; }
      /_NET_NUMBER_OF_DESKTOPS/ { no_ws = $3; }
      /_NET_DESKTOP_NAMES/ { for (i = 3; i < no_ws + 3; i++) {
                               names[i - 3] = $i;
                               gsub( "\"|,", " ", names[i - 3]);
                               gsub ("[[:space:]]*", "", names[i - 3]);
                             };
                           };
      END { 
        print names[current - 1]" "current"/"no_ws;
      };'
#to also change wallpaper
fbsetbg ~/.fluxbox/bg$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}').png

