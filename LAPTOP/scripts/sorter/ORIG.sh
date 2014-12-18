#!/bin/bash
#
#
#

################################################
#
# Functions
#
################################################

DIR=$(pwd)


Music()
{
if [ -e "$DIR/Music" ];then
       echo -n ""
else
       mkdir Music
fi

mv *.mp3 "$DIR/Music" 2>/dev/null
mv *.wav "$DIR/Music" 2>/dev/null
mv *.midi "$DIR/Music" 2>/dev/null
}

Movies()
{
if [ -e "$DIR/Movies" ];then
       echo -n ""
else
       mkdir Movies
fi

mv *.avi "$DIR/Movies" 2>/dev/null
mv *.mpeg "$DIR/Movies" 2>/dev/null
mv *.mpg "$DIR/Movies" 2>/dev/null
}


Pictures()
{
if [ -e "$DIR/Pictures" ];then
       echo -n ""
else
       mkdir Pictures
fi

mv *.jpeg "$DIR/Pictures" 2>/dev/null
mv *.jpg "$DIR/Pictures" 2>/dev/null
mv *.gif "$DIR/Pictures" 2>/dev/null
mv *.png "$DIR/Pictures" 2>/dev/null
}

Compressed()
{
if [ -e "$DIR/Compressed" ];then
       echo -n ""
else
       mkdir Compressed
fi

mv *.zip "$DIR/Compressed" 2>/dev/null
mv *.rar "$DIR/Compressed" 2>/dev/null
mv *.7z "$DIR/Compressed" 2>/dev/null
mv *.tar "$DIR/Compressed" 2>/dev/null
mv *.tar.bz2 "$DIR/Compressed" 2>/dev/null
mv *.tar.gz "$DIR/Compressed" 2>/dev/null
}


################################################
#
# Main Program
#
################################################

Music
Movies
Pictures
Compressed
