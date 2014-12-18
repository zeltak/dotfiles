#!/bin/bash
FULL=$(basename "$1")
EXT="${FULL##*.}"
FILE="${filename%.*}"
DIR=$(dirname "$1")
cd $DIR

for i in *.$EXT; do inkscape "$DIR"/"$i" -l "$i".svg; done
