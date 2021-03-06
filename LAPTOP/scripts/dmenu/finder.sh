#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

input="$(xsel -o | $DMENU -p "file search":)"
if [ "$input" != '' ]
then
	result="$(echo "$input" | locate -e -r "$input" | $DMENU -p "search result:" )"
	xdg-open "$result"
fi
