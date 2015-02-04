#!/bin/sh
# Add org file changes to the repository
REPOS="/home/zeltak/.emacs.d/    /home/zeltak/dotfiles/    /home/zeltak/org/files/ "

for REPO in $REPOS
do
    echo "-----------------------------------"
    echo "Repository: $REPO"
    echo "-----------------------------------"
    echo ""
    cd $REPO
    #Pull
    git pull
    # Remove deleted files
    git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
    # Add new files
    git add -A >/dev/null 2>&1
    git commit -m "zuni $(date)"
    git push
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
done

echo "-----------------------------------"
echo "Moving to Unison syncs"
unison sync
