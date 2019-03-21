# -*- mode: sh -*-

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# ranger-cd
source ~/.config/ranger/bash_automatic_cd.sh
# ranger prompt
# from https://github.com/ranger/ranger/issues/1374
if [ -n "$RANGER_LEVEL" ]; then export PS1="[R]$PS1"; fi
