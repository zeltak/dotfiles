#!/bin/bash

#MPD_HOST=127.0.0.1
MUSIC_PATH="/home/zeltak/Zmusic"   #do not put a / at the end
SONG=$(mpc -f %file% | head -n 1)
FILENAME=$(basename "$MUSIC_PATH/$SONG")
EXTENSION="${FILENAME##*.}"


#echo "$EXTENSION"

if [[ $EXTENSION == flac ]]; 
then metaflac --remove-tag=comment "$MUSIC_PATH/$SONG" && metaflac --set-tag=comment=$1 "$MUSIC_PATH/$SONG" && metaflac --remove-tag=FMPS_RATING "$MUSIC_PATH/$SONG" && metaflac --set-tag=FMPS_RATING=$1 "$MUSIC_PATH/$SONG"

elif [[ $EXTENSION == mp3 ]]; 
then id3v2 --TXXX "FMPS_Rating":"$1" "$MUSIC_PATH/$SONG"

elif [[ $EXTENSION == ogg ]];
then echo "disabled for now"
#then vorbiscomment -l file.ogg > ~/tags.list && sed -e -i "s/^COMMENT=.*/COMMENT=$1/g" && vorbiscomment -w -c file.txt "$MUSIC_PATH/$SONG" && vorbiscomment -a "$MUSIC_PATH/$SONG" -t "COMMENT=$1" && vorbiscomment -a "$MUSIC_PATH/$SONG" -t "FMPS_RATING"
	
else echo "No supported Filetype"
fi
