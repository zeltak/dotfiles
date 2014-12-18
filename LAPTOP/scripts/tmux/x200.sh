#!/bin/sh
tmux -2  new-session -d  -s zx200
tmux new-window -t zx200:1 -n 'term' 'bash'
tmux new-window -t zx200:2 -n 'term2' 'bash'  
tmux new-window -t zx200:3 -n 'Rterm' 'su -'  
tmux new-window -t zx200:4 -n 'sys'
tmux split-window -h 'exec htop &'
tmux select-window -t zx200:2
tmux -2 attach-session -t zx200

