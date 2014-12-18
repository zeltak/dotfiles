#!/bin/bash

for i in *.flac; do tags="$(mutagen-inspect "$i")"
    album="$(echo "$tags" | grep -i "^ALBUM=" | cut -d '=' -f2-)"
    albumartist=$(echo "$tags" | grep -i "^ALBUMARTIST=" | cut -d '=' -f2-)
    artist="$(echo "$tags" | grep -i "^ARTIST=" | cut -d '=' -f2-)"
    date="$(echo "$tags" | grep -i "^DATE=" | cut -d '=' -f2-)"
    track="$(echo "$tags" | grep -i "^TRACKNUMBER=" | cut -d '=' -f2-)"
    title="$(echo "$tags" | grep -i "^TITLE=" | cut -d '=' -f2-)"
    comment="$(echo "$tags" | grep -i "^COMMENT=" | cut -d '=' -f2-)"
#    album="$(echo "$tags" | grep -i "^TALB=" | cut -d '=' -f2-)"
#    albumartist="$(echo "$tags" | grep -i "^TPE2=" | cut -d '=' -f2-)"
#    artist="$(echo "$tags" | grep -i "^TPE1=" | cut -d '=' -f2-)"
#    date="$(echo "$tags" | grep -i "^TDRC=" | cut -d '=' -f2-)"
#    track_temp="$(echo "$tags" | grep -i "^TRCK=" | cut -d '=' -f2-)"
#    track="$(echo "$track_temp" | cut -d '/' -f1)"
#    title="$(echo "$tags" | grep -i "^TIT2=" | cut -d '=' -f2-)"
#    comment="$(echo "$tags" | grep -i "^COMM==" | awk -F "'=" '{ print $2 }')"
if [[ -z "$comment" ]]; then
    echo "no rating for file, skipping"
else
    if [[ -a "${albumartist}--${date}--${album}.ratings" ]]; then
      echo "ratings file already exists"
        echo "rating=${comment}/5 ${artist}--${track}--${title}" >> "${albumartist}--${date}--${album}.ratings"
    else
        touch "${albumartist}--${date}--${album}.ratings"
        echo "albumartist=${albumartist}" >> "${albumartist}--${date}--${album}.ratings"
        echo "album=${album}" >> "${albumartist}--${date}--${album}.ratings"
        echo "date=${date}" >> "${albumartist}--${date}--${album}.ratings"
        echo "rating=${comment}/5 ${artist}--${track}--${title}" >> "${albumartist}--${date}--${album}.ratings"
    fi
fi
done
