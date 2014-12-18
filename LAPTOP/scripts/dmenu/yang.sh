#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
  . $HOME/.dmenurc
else
  DMENU='dmenu -i'
fi


dmenu= "$(dmenu_path | yeganesh -- -p 'Launch app' -fn Monospace-10  -nb '#080808' -nf '#00bbff' -sb '#3c3c3c' -sf '#FECF35')"


