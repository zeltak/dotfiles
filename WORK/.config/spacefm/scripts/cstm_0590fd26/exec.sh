#!/bin/bash
# Copy files to horizontally adjacent panel
# enable Run As Task & Popup Error
$fm_import

if [ "${fm_file}" = "" ]; then
    echo "No files are selected."
    exit 1  # this triggers a popup if Popup Error is set
fi

case "$fm_panel" in
    1 )
	dest_dir="${fm_pwd_panel[2]}"
	;;
    2 )
        dest_dir="${fm_pwd_panel[1]}"
        ;;
    3 )
        dest_dir="${fm_pwd_panel[4]}"
        ;;
    4 )
        dest_dir="${fm_pwd_panel[3]}"
        ;;
esac

if [ "$dest_dir" = "" ]; then
    echo "Adjacent panel is not open"
    exit 1
fi

mv "${fm_files[@]}" "$dest_dir"

exit $?
