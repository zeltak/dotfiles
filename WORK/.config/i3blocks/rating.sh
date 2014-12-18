#!/bin/bash
rating="$(mpc sticker "$(mpc current -f '%file%')" get rating 2>&1 | awk '{ print $NF }')"
if [[ "$rating" == "sticker" ]]; then
    echo "Not rated"
else
    echo "$rating"
fi
