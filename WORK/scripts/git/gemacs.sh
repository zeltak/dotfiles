#!/bin/bash  
TODAY=$(date)
cd /home/zeltak/.emacs.d/
git add -A 
git commit -m "$TODAY"  
git push

