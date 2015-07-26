#!/bin/bash
rsync  -aRPz --delete  -L --exclude='.git/'  -e "ssh -p 12121" /home/zeltak/.emacs.d/ /home/zeltak/ThemeDB /home/zeltak/music/ /home/zeltak/org/ /home/zeltak/dotfiles/ /home/zeltak/.ssh  /home/zeltak/Sync/ /home/zeltak/Uni/ /home/zeltak/.password-store/ /home/zeltak/.gnupg/    admin@10.0.0.2:/share/MD0_DATA/Rsync/
