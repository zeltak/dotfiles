#!/bin/bash
# This script relies on the actual brightness beeing adjusted somewhere else and
# only launches the popup.

# These variables may need adjustment depending on your setup
dev_path=/sys/class/backlight/acpi_video0
max_brightness=$(cat $dev_path/max_brightness)
brightness=$(cat $dev_path/brightness)

# change the icon to your personal liking or call thor-cli with "--no-image" option
icon="/usr/share/icons/gnome/256x256/status/dialog-information.png"

# put in a message to display or leave empty for no message at all
message="Brightness  <b>$brightness/$max_brightness"

thor-cli -b"$brightness/$max_brightness" -i"$icon" -m"$message"
