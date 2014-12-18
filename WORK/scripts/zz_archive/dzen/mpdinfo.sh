#!/bin/sh
#
#
#
# (c) 2007, by Jochen Schweizer
# (c) 2007 Christian Dietrich
# with help from Robert Manea
 
BG='#222'
FG='#ccc'
GH=7
GW=50
GFG='#aecf96'
GBG='#37383a'
FONT=fixed
 
X=0
Y=0
WIDTH=1060
 
FW="mpc volume +5"      # 5 sec forwards
RW="mpc volume -5"      # 5 sec backwards
NEXTS="mpc next"      # previous song
PREVS="mpc prev"      # next song
TOGGS="mpc toggle"    # play/pause
FILE=/dev/shm/musicmeter.$USER
ICONPATH=$HOME/.dzen
 
MAXPOS="100"
 
while :; do
  MPC="`mpc`"
  POS=`echo "$MPC" | sed -ne 's/volume: \(.*\)%.*/\1/p'`
  POSM="$POS $MAXPOS"
  TITLE=`mpc | line`
  (
  echo  -n "^tw()^i(${ICONPATH}/music.xbm)"
  echo "$POSM" | gdbar -h $GH -w $GW -fg $GFG -bg $GBG -nonl
  echo "  $TITLE"
  echo "^cs()"
  echo "$MPC" | sed 's/\[/[^fg(green)/; s/\]/^fg()]/'
 
### Warning: due to problems with the wiki engine, you have to manually add a space after 'i  \', it has to be 'i  \ '
  echo $( (echo ""; mpc playlist) | grep -C 1 "^>" | sed  -ne "1 s/^[^)]*) /^fg(red)Previous:^fg() /p;
  i  \ 
  ;3 s/^[^)]*) /^fg(green)Next:^fg() /p;"  | tr -d "\n")
  ) > $FILE
  cat $FILE
  sleep 1
done |  dzen2 -x $X -y $Y -w $WIDTH -ta l -sa c -fg $FG -bg $BG \
       -fn $FONT -l 4  \
       -e "button4=exec:$RW;button5=exec:$FW;button1=exec:$NEXTS;
          ;button3=exec:$PREVS;button2=exec:$TOGGS;entertitle=uncollapse;leavetitle=collapse"
