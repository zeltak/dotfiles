#!/bin/bash

dmenu_opts="-xs -b -i -l 15"

mpd()   { socat - tcp-connect:localhost:6600 ; } 
query() { echo $* | mpd ; }
get()   { grep "^$1:" | sed 's|^'$1': \(.*\)|\1|' ; }

pick(){
  case "$(echo -e "album\ntrack" | dmenu $dmenu_opts -p "pick what?")" in
    "album")  query list filename album "\"$(query list album | get Album | dmenu $dmenu_opts -p "pick album")"\" | get file ;;
    "track")  query listall | get file | dmenu $dmenu_opts -p "select song" ;;
    *) exit 1;;
  esac
}

add()     { gawk 'BEGIN {print "command_list_begin"}      {printf "addid \"%s\"\n", $0}             END {print "command_list_end"}' ; }
queue()   { gawk 'BEGIN {i=0;print "command_list_begin"}  /Id:/ {i--;printf "moveid %d %d\n",$2,i}  END {print "command_list_end"}' ; }

pick | add | mpd | queue | mpd


#itai added this line to kill random when executed

mpc random off

# vim:set ts=2 sw=2 et:
