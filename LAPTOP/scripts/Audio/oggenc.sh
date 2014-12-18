#!/bin/bash
cd "$1"
if [ "$3" = opus ]
then export CODEC="opus -q 128"
elif [ "$3" = ogg ]
then export CODEC="ogg -q 7"
else
echo "Syntax: batchenc INPUTDIR OUTPUTDIR {opus,ogg}"
:
exit
fi
find * -type f -name '*.flac' -exec dirname '{}' ';' | sort -u | while read d; do caudec -P "$2" -k -c $CODEC "$d"/*.flac; done
