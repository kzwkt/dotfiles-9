#!/bin/bash

tmux new-session -ds 0 > /dev/null 2>&1
tmux new-session -ds 1 > /dev/null 2>&1
tmux new-session -ds 2 > /dev/null 2>&1
tmux new-session -ds 3 > /dev/null 2>&1
tmux new-session -ds 4 > /dev/null 2>&1
tmux new-session -ds 5 > /dev/null 2>&1
tmux new-session -ds python > /dev/null 2>&1
tmux attach -t 0 &>/dev/null || tmux switch-client -t 0

# vim: ft=tmux nowrap
