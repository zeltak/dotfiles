 #!/bin/sh

tmux new-session -d -s sub_cp
tmux new-window -t sub_cp:1 -n 'main' 'bash'
tmux splitw -h -p 50 -t 0 'task shell' 
tmux splitw -v -p 50 -t 0 'bash' 
tmux selectp -D 1
tmux splitw -v -p 50 -t 0 'bash' 
tmux select-window -t sub_cp:1
tmux -2 attach-session -t sub_cp
