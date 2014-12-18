#!/bin/bash  
TODAY=$(date)
cd /home/zeltak/org/files/
git add -A 
git commit -m "$TODAY"  
git push

