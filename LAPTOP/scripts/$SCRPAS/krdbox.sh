#!/bin/bash
while true; do
    if [ "$(pgrep dropbox)" ]
          then killall -9 dropbox
                sleep 20
                  dropboxd
              else
                    dropboxd
                fi
                sleep 300
            done
