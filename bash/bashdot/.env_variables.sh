#!/usr/bin/env bash

# From: https://github.com/DaveDavenport/rofi/issues/584#issuecomment-384555551
# Limit displayed directories in the prompt
# export CLASSPATH=/home/dave/maps/java/my_classes:.:/home/dave/maps/java/my_jar/my.jar
export PROMPT_DIRTRIM=2
export SUDO_ASKPASS="~/bin/askpass-rofi rofi -show run"
export nvim=~/.config/nvim
export em=~/.emacs.d
export maps=~/.maps
export dot=~/dotfiles
export EA_EDITOR='emacsclient --socket-name=gui-emacs -a "" -c'
export conf=~/.config
export mega=/home/mega
export big=/home/BigHome
export apps=~/.maps/apps
export nv=~/.config/nvim
export share=~/.local/share
export box=/home/BigHome/Dropbox
export NVIM_GTK_NO_HEADERBAR=0
PATH="$NPM_PACKAGES/bin:$PATH"
export NVIM_GTK_NO_HEADERBAR=1
export ebooks=/home/mega/Ebooks
export XDG_CONFIG_HOME=~/.config
export fonts=~/.local/share/fonts
export doc=/home/BigHome/Documents
export NVIM_GTK_PREFER_DARK_THEME=1
export down=/home/BigHome/Downloads
export RANGER_LOAD_DEFAULT_RC=FALSE
export NVIM_GTK_PREFER_DARK_THEME=1
export docs=/home/BigHome/Documentos
export FZF_CTRL_T_OPTS="+s --tiebreak=begin"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export MANPAGER="nvim -c 'set ft=man' -c 'set nowrap' -"
export man="/home/dave/.local/share/man/man1"
export FZF_DEFAULT_COMMAND="ppd=$(pwd) && fd -H -L -d 2 . $ppd"
export FZF_ALT_C_COMMAND="ppc=$(pwd) && fd -H -L -d 2 -t d \
-E *\.[Pp]y[Cc]harm* \
-E \.cache \
-E \.git \
-E \.back \
-E \.IdeaIC2018.3 \
-E \.conky \
-E \.dbus \
-E \.gem \
-E \.gnome \
-E \.gnupg \
-E \.kde \
-E \.java \
-E \.nmp \
-E \.thunderbird \
-E \.tmp \
-E \.ssh \
-E \.ssr \
-E \.pki \
-E \.mozilla \
-E \.m2 \
-E \.mplayer \
-E \.texlive \
-E \.thumbnails \
-E \.tooling \
-E \.android . $ppc"
