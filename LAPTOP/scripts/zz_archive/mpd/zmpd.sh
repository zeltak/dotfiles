#!/bin/bash
#
# pbrisbin 2010
#
# http://pbrisbin.com/bin/mpdmenu
#
# interact with mpd via mpc through some dmenu's
#
###

message() { echo 'usage: mpdmenu'; exit 1; }

find_track() {
  local choice

  sleep 0.5 && choice="$(mpc --format '%position% %title% by %artist% on %album%' playlist | cut -c 1-90 | $DMENU | cut -d ' ' -f 1)"

  [[ -z "$choice" ]] && return 1

  mpc --no-status play $choice
}

add() {
  local type="$1" clear="$2" choice

  sleep 0.5 && choice="$(mpc list "$type" | $DMENU)"

  [[ -z "$choice" ]] && return 1

  $clear && mpc --no-status clear
  mpc search "$type" "$choice" | mpc --no-status add
  mpc --no-status play

  return 0
}

add_all() {
  mpc --no-status clear
  mpc ls | mpc --no-status add
  mpc --no-status play
}

add_playlist() {
  local choice

  sleep 0.5 && choice="$(mpc lsplaylists | $DMENU)"

  [[ -z "$choice" ]] && return 1

  mpc load "$choice"
}

run() {
  local choices choice
  
  choices="\nmpd_fav\nrandom\nrepeat\nfind track\nadd artist\nadd album\nadd track\nclear/add artist\nclear/add album\nclear/add track\nadd all\nadd playlist"

  choice="$(echo -e "$choices" | $DMENU)"

  [[ -z "$choice" ]] && return 1
  
  case "$choice" in
    'mpd_fav')          mpc --no-status toggle ;;
    'random')           mpc --no-status random ;;
    'repeat')           mpc --no-status repeat ;;
    'find track')       find_track             ;;
    'add artist')       add artist false       ;;
    'add album')        add album  false       ;;
    'add track')        add track  false       ;;
    'clear/add artist') add artist true        ;;
    'clear/add album')  add album  true        ;;
    'clear/add track')  add title  true        ;;
    'add all')          add_all                ;;
    'add playlist')     add_playlist           ;;
  esac
}

[[ -f "$HOME/.dmenurc" ]] && . "$HOME/.dmenurc" || DMENU='dmenu -i'

run
