#!/bin/bash  
TODAY=$(date)
cd /home/zeltak/rcgit/
git add -A 
git commit -m "$TODAY"  
git push

