#!/bin/bash
USER=ikloog
PASS=XXXXX
 
last=0
cur=0
mailcheck=`curl -u $USER:$PASS --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;' | grep -v 'Inbox\|^\s' | wc -l`
 
while [ : ]
do
  curl -u $USER:$PASS --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;' | grep -v 'Inbox\|^\s' | wc -l 
  if [ $? -eq 0 ]
  then
    cur=$mailcheck
    if [ $cur -ne $last ]
    then
      notify-send -i "/usr/share/pixmaps/mail-notification.xpm" "New Mail: $cur"
      last=$cur
    fi
  fi
  sleep 60
done
