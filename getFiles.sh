#!/bin/bash

cp -r $HOME/.config/terminator terminator
if [ ! -f /.config/i3 ]; then
	
      cp -r $HOME/.config/i3 i3
   
	fi
cp $HOME/.vimrc vimrc
cp $HOME/.zshrc ZSH/zshrc
cp $HOME/.tmux.conf tmux.conf

