#!/bin/sh

#profile file, runs on login

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export EDITOR=nvim
export TERMINAL=termite
export BROWSER=firefox
export READER="zathura"

source $HOME/.zshrc

export QT_QPA_PLATFORMTHEME="qt5ct"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here

