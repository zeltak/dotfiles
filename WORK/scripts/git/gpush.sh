#!/bin/bash
TODAY=$(date)

if [[ "$HOST" == "zuni" ]] || [[ "$HOST" == "voices" ]]; then echo zuni;
	cd /home/zeltak/dotfiles/
	git pull
	git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
	git add -A
	git commit -m "$TODAY by $HOST"
	git push




elif [[ "$HOST" == "bar" ]]; then
	cd /home/zeltak/.emacs.d/
	git pull
	git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
	git add -A
	git commit -m "$TODAY-$HOST"
	git push

elif [[ "$HOST" == "r" ]]; then
	git pull
	cd /home/zeltak/org/files/
	git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
	git add -A
	git commit -m "$TODAY-$HOST"
	git push


else
exit
fi 
