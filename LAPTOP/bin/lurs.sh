#!/bin/bash

#mirror music library
rsync -aRPz --delete -e ssh /home/zeltak/music  root@132.72.152.204:/volume1/rsync/     

#Emacs
rsync -aRPz --delete -e ssh --exclude='.git/'  /home/zeltak/.emacs.d/  root@132.72.152.204:/volume1/rsync/       #&> /dev/null

#org
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/org/  root@132.72.152.204:/volume1/rsync/           #&> /dev/null

#dotfiles
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/dotfiles/  root@132.72.152.204:/volume1/rsync/       #&> /dev/null

#ssh
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/rsync/          #&> /dev/null

#images/phtos
rsync -aRPz --delete -e ssh /home/zeltak/Pictures/  root@132.72.152.204:/volume1/rsync/    / &> /dev/null

#ThemeDB
rsync -aRPz --delete -e ssh /home/zeltak/ThemeDB/  root@132.72.152.204:/volume1/rsync/    / &> /dev/null





###final notify
#notify-send -u critical "back to synology for today done"
