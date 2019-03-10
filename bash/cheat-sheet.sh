#!/usr/bin/env bash
# -*- mode: sh -*-

#  keybindings
# M-y: Clear
"y": "\C-k \C-uclear\n"
# C-l: Clear and list
"": "\C-k \C-uclear && ls --color=always\n"
# M-u: Go Up
"u": "\C-k \C-ue ..\n"
# M-p: Go Backwards
"p": "\C-k \C-ub\n"
# C-t: Go last
"": "\C-k \C-ub\n"
# C-/: list
"": "\C-k \C-uls --color=always\n"
# M-' cheat sheet
"": "\C-k \C-ubat /home/dotfiles/bash/cheat-sheet"
