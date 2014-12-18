#!/bin/bash 

# case $1 in
#     org)
#       emacsclient -c /home/zeltak/Dropbox/Org/agenda/z1.org &
#       sleep 2
#       i3-msg move workspace 8:NC
#       ;;
#     *)
#       emacsclient -c  &
#       sleep 2
#       i3-msg move workspace 9:Vim
#       ;;
# esac

i3-msg workspace 8:NC; sleep 1; emacsclient -c /home/zeltak/org/files/agenda/z1.org
