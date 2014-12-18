#!/bin/bash

#ssh_lastfm=1
ssh_host=tauron

lastFMCheck () {
# Some Variables to clean up the code

        if [[ -z $ssh_lastfm ]]; then
            if [[ -n $(pgrep mpdscribble) ]]; then
                echo "●"
            else
                echo "○"
            fi
        else
            mpds_check="$(ssh $ssh_host -q -t 'bash -c "pgrep mpdscribble"')"
            if [ -n "$mpds_check" ]; then
                echo "●"
            else
                echo "○"
            fi
       fi
}

lastFMCheck
