#!/bin/bash

shopt -s nullglob globstar

list_passwords() {
    basedir=~/.password-store/
    passwords=( ~/.password-store/**/*.gpg )
    for password in "${passwords[@]}"
    do
        filename="${password#$basedir}"
        filename="${filename%.gpg}"
        echo $filename
    done
}

xdotool_command() {
     echo "type "
     pass "$selected_password" | head -1
}

selected_password="$(list_passwords 2>/dev/null| rofi -dmenu)"
show=$(echo -e "Pass\nUser\nUser>Pass" | rofi -dmenu)

if [ -n "$selected_password" ]
then
    if [[ $show == "Pass" ]]; then
        password=$(pass "$selected_password" | head -1)
        xdotool type "$password"
    elif [[ $show == "User" ]]; then
        user=$(pass "$selected_password" | awk -F ': ' 'NR == 2 { print $2 }')
        xdotool type "$user"
    elif [[ $show == "User>Pass" ]]; then
        password=$(pass "$selected_password" | head -1)
        user=$(pass "$selected_password" | awk -F ': ' 'NR == 2 { print $2 }')
        xdotool type "$user"
        xdotool keydown Tab && xdotool keyup Tab
        xdotool type "$password"
    fi
fi
