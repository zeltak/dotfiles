#!/bin/sh
mpc random off  && echo "mpd random off" |  dzen2 -y 998 -x 455 -h 20 -ta c -sa c -tw 400 -w 400  -fg "#FF086A" -bg "#EEEEEC" -fn "Envy Code R"   -p 2  -e onstart=togglecollapse ;

