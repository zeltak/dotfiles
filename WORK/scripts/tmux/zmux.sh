#!/bin/sh

tmux -2  new-session -d  -s zdock_main
tmux new-window -t zdock_main:1 -n 'term' 'bash'
tmux new-window -t zdock_main:2 -n 'weechat' 'bash'
tmux new-window -t zdock_main:3 -n 'DL' 'bash'

tmux new-window -t zdock_main:4 -n 'Sys' 
tmux split-window 'htop'
tmux split-window 'glance'
tmux select-layout tiled

tmux new-window -t zdock_main:5 -n 'mc' 'mc'

tmux -2 attach-session -t zdock_main
