#!/bin/bash
MPD_HOST=/home/zeltak/.mpd/socket mpc add "file://`readlink -f "$1"`"
