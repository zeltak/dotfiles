tmux new-session -d 'bash'
tmux split-window 'htop'
tmux split-window 'top'
tmux select-layout tiled
tmux attach
