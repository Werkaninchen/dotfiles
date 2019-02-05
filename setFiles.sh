#!/bin/bash

cp vimrc $HOME/.vimrc
cp terminatorConfig $HOME/.config/terminator/config
cp -r i3 $HOME/.config/i3
cp ZSH/zshrc $HOME/.zshrc
cp -rf ZSH/plugins $ZSH/custom/plugins
cp -rf ZSH/themes $ZSH/cusom/themes
cp tmux.conf $HOME/.tmux.conf
cd $ZSH/themes 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting.theme

