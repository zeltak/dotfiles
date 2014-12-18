#!/bin/bash
scrot -s  '%Y-%m-%d-@%H-%M-%S-scrot.png' -e 'fb $f && mv $f /home/zeltak/screenshots/' && notify-send -u critical -i "/home/zeltak/MLT/programs/worker/Arch.png" 'SCROT' 'Uploaded to FB'

