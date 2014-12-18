#!/bin/bash

cd /home/zeltak/Zmusic/ && find . -type f -mtime -9  | egrep '\.mp3$|\.flac$' | awk '{ sub(/^\.\//, ""); print }' > /home/zeltak/.mpd/playlists/newmusic.m3u