#!/bin/bash

emacsclient --socket-name=terminal-emacs --create-frame -nw --alternate-editor="" --eval "(man \"$*\")"

