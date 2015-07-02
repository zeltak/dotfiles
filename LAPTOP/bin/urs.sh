#!/bin/bash

#Emacs
rsync -aRPz --delete -e ssh --exclude='.git/'  /home/zeltak/.emacs.d/  root@132.72.152.204:/volume1/rsync/       #&> /dev/null
#org
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/org/  root@132.72.152.204:/volume1/rsync/           #&> /dev/null
#dotfiles
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/dotfiles/  root@132.72.152.204:/volume1/rsync/       #&> /dev/null
#ssh
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/rsync/          #&> /dev/null
#music
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/music/  root@132.72.152.204:/volume1/rsync/          #&> /dev/null

#sync folder
rsync -aRPz --delete -e ssh /home/zeltak/Sync/ root@132.72.152.204:/volume1/rsync/          #&> /dev/null

# uni folder 
rsync -aRPz --delete -e ssh /home/zeltak/Uni/ root@132.72.152.204:/volume1/rsync/          #&> /dev/null



###final notify
#notify-send -u critical "back to synology for today done"
