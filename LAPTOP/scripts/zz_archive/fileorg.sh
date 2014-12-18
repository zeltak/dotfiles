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

Pdf()
{
if [ -e "$DIR/Pdf" ];then
       echo -n ""
else
       mkdir Pdf
fi

mv *.pdf "$DIR/Pdf" 2>/dev/null
}


Torrent()
{
if [ -e "$DIR/Torrent" ];then
       echo -n ""
else
       mkdir Torrent
fi

mv *.torrent "$DIR/Torrent"" 2>/dev/null
}


Windows()
{
if [ -e "$DIR/Windows" ];then
       echo -n ""
else
       mkdir Windows
fi

mv *.exe "$DIR/Windows"" 2>/dev/null
}



Docs()
{
if [ -e "$DIR/Docs" ];then
       echo -n ""
else
       mkdir Docs
fi

mv *.doc "$DIR/Docs" 2>/dev/null
mv *.xls "$DIR/Docs" 2>/dev/null
mv *.docx "$DIR/Docs" 2>/dev/null
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


nix_install()
{
if [ -e "$DIR/nix_install" ];then
       echo -n ""
else
       mkdir nix_install
fi

mv *.deb "$DIR/nix_install" 2>/dev/null
mv *.rpm "$DIR/nix_install" 2>/dev/null
mv *.pkg.tar.xz "$DIR/nix_install" 2>/dev/null
}




################################################
#
# Main Program
#
################################################

Music
Movies
Pdf
Torrent
Windows
Docs
Pictures
Compressed
nix_install
