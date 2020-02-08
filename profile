#!/bin/sh

#profile file, runs on login

export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export TERMINAL=kitty
export BROWSER=brave
export READER="zathura"
export STATUSBAR="i3blocks"

source $HOME/.zshrc

export QT_QPA_PLATFORMTHEME="qt5ct"

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here

