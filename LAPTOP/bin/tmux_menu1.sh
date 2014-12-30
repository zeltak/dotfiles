#!/bin/bash
case $1 in 
  o) tmux new-window -n imap -t 10 ncdu  -o ;;
  m) tmux new-window -n mod ncmpcpp ;;
  w) tmux new-window -n vw vim ;;
esac


