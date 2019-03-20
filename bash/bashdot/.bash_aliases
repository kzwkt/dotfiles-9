alias aas='clear && aptitude search'
alias ins='clear && apt list --installed -a'
alias all='clear && apt list -a'
alias ap='sudo aptitude'
alias aii='sudo aptitude -y install'
# alias ppurge='sudo apt purge && sudo apt -y autoclean && sudo apt -y autoremove'
alias apu='clear && sudo aptitude -y update && sudo apt -y autoremove && sudo apt -y autoclean'
alias appu='clear && sudo apt -y update && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt -y autoclean'

alias att='clear && tmux attach &>/dev/null'
alias det='clear && tmux detach &>/dev/null'
alias tk='tmux kill-server &>/dev/null && pkill -fi tmux &>/dev/null'
alias 0='clear && tmux attach -t 0 &>/dev/null || tmux switch-client -t 0 &>/dev/null'
alias 1='clear && tmux attach -t 1 &>/dev/null || tmux switch-client -t 1 &>/dev/null'
alias 2='clear && tmux attach -t 2 &>/dev/null || tmux switch-client -t 2 &>/dev/null'
alias 3='clear && tmux attach -t 3 &>/dev/null || tmux switch-client -t 3 &>/dev/null'
alias 4='clear && tmux attach -t 4 &>/dev/null || tmux switch-client -t 4 &>/dev/null'
alias 5='clear && tmux attach -t 5 &>/dev/null || tmux switch-client -t 5 &>/dev/null'
alias 6='clear && tmux attach -t 6 &>/dev/null || tmux switch-client -t 6 &>/dev/null'
alias 7='clear && tmux attach -t 7 &>/dev/null || tmux switch-client -t 7 &>/dev/null'
alias 8='clear && tmux attach -t 8 &>/dev/null || tmux switch-client -t 8 &>/dev/null'
alias 9='clear && tmux attach -t 9 &>/dev/null || tmux switch-client -t 9 &>/dev/null'

alias pfix='pulseaudio -k && sleep 3 && pulseaudio --start &'
alias bc='clear && nvim /home/dotfiles/bash/bashdot/.bash_aliases \
  	       	        ~/.bashrc                                 \
                        ~/.profile                                \
                        ~/.inputrc                                \
                        ~/.bash_profile                           \
                        ~/.env_variables.sh                       \
                        ~/.tmux.conf                              \
                        $nv/mappings.vim                          \
                        $nv/plugins.vim                           \
                        $nv/init.vim                              \
                        $nv/abbrevs.vim                           \
                        /home/dotfiles/bash/bashdot/.bash_aliases \
                        ~/.bashrc                                 \
                        ~/.config/i3/config                       \
                         $nv/mappings.vim                         \
			 $nv/init.vim                             \
			 $nv/abbrevs.vim                          \
                        ~/.config/ranger/rc.conf'

alias tc='clear && task completed'
# alias t='task'
# alias ta='task add'
# alias td='task done'
# alias tm='task modify'
# alias ttd='task delete'

alias nnn='emacs -nw'

alias add='clear && git add -A && ls --color'
alias com='clear && git commit -am'
alias clone='git clone'
alias cl='git clone'
alias push='clear && git push && ls --color'

# alias t='~/maps/tldr++/tldr'
# Markdown to Org
# pandoc -f markdown -t org -o newfile.org markdown_file.md
# Change Java:
# sudo update-alternatives --config java
alias time='/usr/bin/time'
alias v='nvi'
alias alternatives_editor='sudo update-alternatives --config editor'
alias alternatives='sudo update-alternatives --config'
alias bb='bat'
alias free='clear && free -h'
alias p='clear && python3'
alias gig='clear && nvim .gitignore'
alias fl='flatpak'
alias fr='flatpak run'
alias yt='youtube-dl --all-subs'
alias setk0='setxkbmap -option'
alias setkk='~/scripts/keyboard/init_keys.sh'
alias wal='feh --recursive --randomize --bg-fill'
alias wallblack='feh --recursive --randomize --bg-fill allblack.png'
alias sm='sudo make clean install'
alias smc='sudo make clean checkinstall'
alias tv='tvnamer'
alias tvv='tvnamer --recursive --always ./*'
alias setblank='xset dpms'
alias unlock='trash-put /home/dotfiles/.git/index.lock'
alias scca='clear && i3-msg move scratchpad &>/dev/null'
alias wh='whereis'
alias sbp='clear && source ~/.bash_profile'
alias rfonts='fc-cache -f -v'
alias ag='ag'
alias ch='cht.sh --shell'
alias r='e -'
alias w='e ..'
alias n='nvim'
alias d='cd'
alias c='clear'
alias md='mkdir'
# alias d='clear && ranger'
alias g='grep -i'
alias ko='kill -9'
alias sym='ln -rsf'
alias symsudo='sudo ln -rsf'
alias pk='pkill -fi'
alias ttp='trash-put'
# alias tpp='trash-put ./*'
alias sd='sudo '
alias ls='ls --color=always'
alias ll='ls -l'
alias qq='clear && exit'
alias update='updatedb'
# alias info='info --vi-keys'
alias h='help'
alias beet_config='beet config -e'
alias bee='beet import -q -p -i'
alias chmode='chmod -Rc 755'
alias restore='sudo restore-trash'
alias pi2='pip2 install --user'
alias pi3='pip3 install --user'
alias k='clear && xbindkeys -k'
alias chowne='chown -Rhc $USER'
alias ss='clear && exec "$BASH"'
alias empty='sudo trash-empty &'
alias cc='clear && ls -A --color'
alias ccl='ls -A --color'
alias lo='sudo updatedb && locate'
alias off='clear && sudo poweroff'
alias x='xclip -selection clipboard'
# alias pwx='clear && echo -n $(pwd) | x'
alias pwx="clear && dirs +0 | \\tr -d '\n' | xclip -selection clipboard"
alias pw='sp && clear && echo -n $(pwd) && echo ""'
alias grp='ps ax | grep -v grep | grep -i'
alias grr='clear && ls -Al --color | grep -i'
alias ds='clear && du --summarize --human-readable ./* | sort --human-numeric-sort --stable --reverse | bat ---color always'
alias dss='du --summarize --human-readable ./* | sort --human-numeric-sort --stable --reverse | bat ---color always --line-range 01:10'
alias briss='java -jar ~/maps/briss-0.9/briss-0.9.jar &'
alias sp='export PS1="\e[38;5;196m$ \[\e[0m\]"'
alias mc='e ~/org/Studying/Linux/scripting_bible/my_code/'
# alias rm='echo "This is not the command you are looking for."; false'
# alias rmm='\rm'
alias web='wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --continue --show-progress --random-wait'
alias web_with_parent='wget --mirror --convert-links --adjust-extension --page-requisites --continue --show-progress --random-wait'
alias createusb='echo -n "dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync" | xclip -selection clipboard'
alias fixusb='echo -n "sudo dd if=/dev/zero of=/dev/sdb bs=2048 count=32" | x && echo "sudo dd if=/dev/zero of=/dev/sdb bs=2048 count=32"'
alias lp='clear && export PS1="\[\e[38;5;241m[\]\[\e[38;5;88m\A\]\[\e[38;5;241m]\]\[\e[38;5;241m[\]\[\e[38;5;88m\u\]\[\e[38;5;241m]\]\n\[\e[38;5;241m[\e[38;5;88m\w\e[38;5;241m]\e[38;5;241m\]\n\$ \[\e[0m\]"'

alias pp='patch -Np1 -i'
alias pa='cp -f ./backup/config.* /home/maps/suckless/source/st'
alias pa='cp -f ./backup/config.* /home/maps/suckless/source/st'
