#!/bin/bash

#Emacs
rsync -aRPz --delete -e ssh --exclude='.git/'  /home/zeltak/.emacs.d/  root@132.72.152.204:/volume1/ursync/       #&> /dev/null
#org
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/org/  root@132.72.152.204:/volume1/ursync/           #&> /dev/null
#dotfiles
rsync -aRPz --delete -L -e ssh --exclude='.git/' /home/zeltak/dotfiles/  root@132.72.152.204:/volume1/ursync/       #&> /dev/null
#ssh
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/ursync/          #&> /dev/null

rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/.config/          #&> /dev/null
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/.fonts/          #&> /dev/null
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/.i3/          #&> /dev/null
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/R/          #&> /dev/null
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/Sync/          #&> /dev/null
rsync -aRPz --delete -e ssh --exclude='.git/' /home/zeltak/.ssh/  root@132.72.152.204:/volume1/Uni/          #&> /dev/null




###final notify
#notify-send -u critical "back to synology for today done"
