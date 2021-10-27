neww -n dbg
send-keys -t dbg cd Space ~/dbg C-m
send-keys -t dbg gdb C-m
split-window -h -t dbg
run-shell -b "tmux send-keys -t dbg.4 dashboard Space -output Space '#{pane_tty}' C-m"
last-pane
