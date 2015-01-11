#!/bin/bash

#mirror music library
rsync -aRPz --delete -e ssh /home/zeltak/music/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#Emacs 
rsync -aRPz --delete  -L --exclude='.git/'  -e ssh /home/zeltak/.emacs.d/  admin@10.0.0.2:/share/MD0_DATA/Rsync/  # &> /dev/null

#org
rsync -aRPz --delete -L --exclude='.git/' -e ssh /home/zeltak/org/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#dotfiles
rsync -aRPz --delete -L  --exclude='.git/' -e ssh /home/zeltak/dotfiles/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#ssh
rsync -aRPz --delete  --exclude='.git/' -e ssh /home/zeltak/.ssh/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#mozilla
rsync -aRPz --delete  --exclude='.git/' -e ssh /home/zeltak/.mozilla/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#kde
#rsync -aRPz --delete -e ssh /home/zeltak/.kde4/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#images/phtos
rsync -aRPz --delete -e ssh /home/zeltak/Pictures/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#ThemDB
rsync -aRPz --delete -e ssh /home/zeltak/ThemeDB/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#sync folder
rsync -aRPz --delete -e ssh /home/zeltak/Sync/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

# uni folder 
rsync -aRPz --delete -e ssh /home/zeltak/Uni/  admin@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

###final notify
#notify-send -u normal "back up for today done"

