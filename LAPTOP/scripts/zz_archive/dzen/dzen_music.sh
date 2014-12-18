#!/bin/sh
mpc status -f "[[%artist% - ]%title%] from [%album%]|[%file%]" | head -1 | dzen2 -l 4 -y 700 -x 0 -p 2;
