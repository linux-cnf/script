#!/bin/bash
#purpose: log into multiple servers and execute commands across them simultaneously
#author: Bablish Jaiswal
#linux.cnf@gmail.com
# Check if at least one server is provided
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <server1> <server2> ... <serverN>"
  exit 1
fi

# Start a new tmux session
SESSION="multi-server"
tmux new-session -d -s "$SESSION"

# Create a pane for each server and SSH into it
for SERVER in "$@"; do
  tmux split-window -t "$SESSION" "ssh $SERVER"
  tmux select-layout -t "$SESSION" tiled  # Organize panes in a grid layout
done

# Close the initial pane (blank pane created with the session)
tmux kill-pane -t "$SESSION:0.0"

# Enable synchronized panes
tmux setw -t "$SESSION" synchronize-panes on

# Attach to the session
tmux attach -t "$SESSION"
