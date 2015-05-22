#!/bin/bash -x
shopt -s nullglob globstar

root="Rasi"
basedir=~/.password-store/
URL_field='URL'
USERNAME_field='UserName'
EDITOR='gvim -f'

list_passwords() {
	passwords=( ~/.password-store/**/*.gpg )

	for password in "${passwords[@]}"; do
		filename="${password#$basedir}"
		filename="${filename%.gpg}"
		echo "$filename"
	done
}

xdotool_type() {
	for (( i=0; i<${#1}; i++ )); do
		xdotool type "${1:$i:1}"
	done
}

mainMenu () {
	selected_password="$(list_passwords 2>/dev/null| rofi -dmenu)"
	rofi_exit=$?
	case ${rofi_exit} in
		0)
			true
			;;
		10)
			true
			;;
		*)
			exit ${rofi_exit}
			;;
	esac

	password_temp=$(pass "$selected_password")
	password=$(echo "${password_temp}" | head -1)
	declare -A stuff

	while read LINE; do
		arrSplit=(${LINE//: / })
		stuff["${arrSplit[0]}"]=${arrSplit[1]}
	done < <(pass "${selected_password}" | tail -n+2 | grep ': ')

	case "$1" in
		password)
			xdotool_type "$password"
			;;
		user)
			xdotool_type "${stuff[${USERNAME_field}]}"
			;;
        show)
            menu=$(echo -e "Edit Entry\n---\n$(pass "$selected_password")" | rofi -dmenu -p "Enter: Copy Entry to Clipboard")
            if [[ "$menu" == "Edit Entry" ]]; then
                EDITOR=$EDITOR pass edit "${selected_password}"
            else
                if [[ -z $(echo "$menu" | grep ": ") ]]; then
                    echo -n "$menu" | xclip
                else
                    echo -n "${menu}" | awk -F ': ' '{ print $2 }' | xclip
                fi
            fi
            ;;
		url)
			xdotool_type "${stuff[${URL_field}]}"
			;;
		*)
			if [[ $(echo "${password_temp}" | tail -1) == "NOTAB" ]]; then
				for i in "${!stuff[@]}"; do
					xdotool_type "${stuff[$i]}"
				done
				xdotool_type "$password"
			else
				for i in "${!stuff[@]}"; do
					if [[ ! "$i" == "${URL_field}" ]]; then
						xdotool_type "${stuff[$i]}"
						xdotool key Tab
					fi
				done
				xdotool_type "$password"
			fi
			;;
	esac

	# cleanup (for the paranoid)
	password=''
	selected_password=''
	password_temp=''
	for i in "${!stuff[@]}"; do
		stuff[$i]=''
		unset stuff[$i]
	done
	unset stuff
	unset password
	unset selected_password
	unset password_temp
	unset stuff
}

insertPass () {
	domain=$(echo "$1" | sed -e 's|^[^/]*//||' -e 's|/.*$||')
	pass=$(echo -e "Password for site $domain" | rofi -dmenu -p "Enter Password > ")
	user=$(echo -e "Username for site $domain" | rofi -dmenu -p "Enter User > ")
	notab=$(echo -e "Yes\nNo" | rofi -dmenu -p "Page uses Auto Tab? > ")

	cd "$HOME"/.password-store/"${root}"
	group=$(find . -maxdepth 1 -type d -not -name '.' -not -name '.git' | sed 's/^.\///g' | rofi -dmenu -p "Choose Group")

	if [[ "$notab" == "No" ]]; then
		pass insert -m -f "${root}"/"$group"/"$domain" < <(echo -e "${pass}\nUser: ${user}\n---\n${domain}")
	elif [[ "$notab" == "Yes" ]]; then
		pass insert -m -f "${root}"/"$group"/"$domain" < <(echo -e "${pass}\nUser: ${user}\n---\n${domain}\nNOTAB")
	fi
}


##########################
##						##
##	script entry point	##
##						##
##########################

case "$2" in
	insert)
		insertPass "$3"
		;;
	type_password)
		mainMenu password
		;;
	type_user)
		mainMenu user
		;;
	type_url)
		mainMenu url
		;;
    show_entry)
        mainMenu show
        ;;
	*)
		mainMenu
		;;
esac

