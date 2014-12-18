#!/bin/bash
scrot -d 4  '%Y-%m-%d-@%H-%M-%S-scrot.png' -e 'mv $f /home/zeltak/screenshots/'   && notify-send -u critical -i "/home/zeltak/MLT/programs/worker/Arch.png" 'SCROT' 'Uploaded to FB'
