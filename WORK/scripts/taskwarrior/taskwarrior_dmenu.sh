#!/bin/bash
PARAMS=$(dmenu -p "Add task:" < /dev/null)
if [ -n "$PARAMS" ]
then
    RESULT=$(task add $PARAMS)
    notify-send "$RESULT"
fi
