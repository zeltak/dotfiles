#!/bin/bash

shopt -s globstar

cd /home/zeltak/music/
cat **/track.ratings | while read line; do
    separator=$(echo ${line} | awk '{ print $2 }')
    artist=$(echo ${line} | awk -F " ${separator} " '{ print $2 }')
    album=$(echo ${line} | awk -F " ${separator} " '{ print $6 }')
    date=$(echo ${line} | awk -F " ${separator} " '{ print $5 }')
    title=$(echo ${line} | awk -F " ${separator} " '{ print $4 }')
    rating=$(echo ${line} | awk -F " ${separator} " '{ print $1 }')
    file=$(mpc find artist "${artist}" album "${album}" date "${date}" title "${title}")
    mpc sticker "${file}" set rating ${rating};
    echo "imported rating of ${rating} for file ${file}"
done
