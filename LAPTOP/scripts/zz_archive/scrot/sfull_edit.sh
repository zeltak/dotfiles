#!/bin/bash
scrot  '%Y-%m-%d-@%H-%M-%S-scrot.png' -e 'mtpaint $f && mv $f /home/zeltak/screenshots '  && notify-send -u critical -i "/home/zeltak/MLT/programs/worker/Arch.png" 'SCROT' 'Uploaded to FB'

