#!/bin/bash

#mirror music library
rsync -aRPz --delete -e ssh /home/zeltak/Uni/  root@132.72.152.204:/volume1/rsync/     
rsync -aRPz --delete -e ssh /home/zeltak/Sync/  root@132.72.152.204:/volume1/rsync/     
rsync -aRPz --delete -e ssh /home/zeltak/org/  root@132.72.152.204:/volume1/rsync/     
rsync -aRPz --delete -e ssh /home/zeltak/.password-store/  root@132.72.152.204:/volume1/rsync/     
rsync -aRPz --delete -e ssh /home/zeltak/.emacs.d/  root@132.72.152.204:/volume1/rsync/     

#Emacs


###final notify
notify-send -u critical "back to synology for today done"
