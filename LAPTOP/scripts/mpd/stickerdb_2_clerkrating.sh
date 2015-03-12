#!/bin/bash
shopt -s globstar

source $HOME/.config/clerk/config

cd ${music_path}
rm -f **/track.ratings
mpc clear
mpc sticker "" find rating | awk -F ': rating=' '{ print $1 }' | while read line; do
    mpc add "$line"
done

mpc playlist -f "%artist% ${separator} %track% ${separator} %title% ${separator} %date% ${separator} %album% ${separator} %file%" | while read line; do
    artist=$(echo ${line} | awk -F "${separator}" '{ print $1 }')
    track=$(echo ${line} | awk -F "${separator}" '{ print $2 }')
    title=$(echo ${line} | awk -F "${separator}" '{ print $3 }')
    date=$(echo ${line} | awk -F "${separator}" '{ print $4 }')
    album=$(echo ${line} | awk -F "${separator}" '{ print $5 }')
    file=$(echo ${line} | awk -F "${separator}" '{ print $6 }')
    echo "$file"
    rating=$(mpc sticker "$file" get rating | awk -F 'rating=??' '{ print $2 }')
    echo "$rating"
    cd "$music_path"
    cd "$(dirname "$(echo "$file")")"
    if [[ "$(pwd)" == */"$cd_divider"* ]]; then
        cd ..
    fi
    touch track.ratings
    echo "${rating}\\${artist}\\${track}\\${title}\\${date}\\${album}" >> track.ratings
done
