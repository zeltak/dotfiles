#!/bin/sh
# Add org file changes to the repository
REPOS="/home/zeltak/dotfiles/    /media/NAS/Uni/org/files/ "

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
echo "Repository: Emacs pull only"
echo "-----------------------------------"
echo ""
cd /home/zeltak/.emacs.d/
git pull
echo ""
echo ""
echo ""
echo ""


