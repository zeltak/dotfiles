#!/bin/sh

tmux -2  new-session -d  -s zdock_main
tmux new-window -t zdock_main:1 -n 'term' 'bash'
tmux new-window -t zdock_main:2 -n 'weechat' 'weechat-curses'

tmux new-window -t zdock_main:3 -n 'DL' 
tmux split-window 'htop'
tmux split-window 'top'
tmux split-window 'top'
tmux split-window 'top'
tmux select-layout tiled

tmux new-window -t zdock_main:4 -n 'Sys' 
tmux split-window 'htop'
tmux split-window 'top'
tmux select-layout tiled

tmux new-window -t zdock_main:5 -n 'ssh' 
tmux split-window 'ssh zeltak@192.168.0.33'
tmux split-window 'cat /proc/mdstat/'
tmux select-layout tiled


tmux select-window -t zdock_main:2
tmux -2 attach-session -t zdock_main
