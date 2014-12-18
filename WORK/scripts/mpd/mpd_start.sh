if [ "$(pidof mpd)" ] 
then
  echo "process was found"
else
   mpd
fi
