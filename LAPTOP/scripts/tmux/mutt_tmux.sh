 #!/bin/sh

#!/bin/sh
tmux new-session -d -s mutt
 
tmux new-window -t mutt:1 -n 'main' 'exec mutt'

 
tmux select-window -t mutt:1
tmux -2 attach-session -t mutt
