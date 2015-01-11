#!/bin/bash

#mirror music library
rsync -aRPz --delete -e ssh /home/zeltak/music/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#Emacs 
rsync -aRPz --delete  -L --exclude='.git/'  -e ssh /home/zeltak/.emacs.d/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/  # &> /dev/null

#org
rsync -aRPz --delete -L --exclude='.git/' -e ssh /home/zeltak/org/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#dotfiles
rsync -aRPz --delete -L  --exclude='.git/' -e ssh /home/zeltak/dotfiles/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#ssh
rsync -aRPz --delete  --exclude='.git/' -e ssh /home/zeltak/.ssh/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#mozilla
rsync -aRPz --delete  --exclude='.git/' -e ssh /home/zeltak/.mozilla/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#kde
#rsync -aRPz --delete -e ssh /home/zeltak/.kde4/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#images/phtos
rsync -aRPz --delete -e ssh /home/zeltak/Pictures/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#ThemDB
rsync -aRPz --delete -e ssh /home/zeltak/ThemeDB/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

#sync folder
rsync -aRPz --delete -e ssh /home/zeltak/Sync/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

# uni folder 
rsync -aRPz --delete -e ssh /home/zeltak/Uni/  zeltak@10.0.0.2:/share/MD0_DATA/Rsync/ #&> /dev/null

###final notify
#notify-send -u normal "back up for today done"

