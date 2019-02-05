#!/bin/bash

cp $HOME/.config/terminator/config terminatorConfig
cp -rf $HOME/.config/i3 i3
cp $HOME/.vimrc vimrc
cp $HOME/.zshrc ZSH/zshrc
cp -rf $ZSH/custom/plugins ZSH/plugins
cp -rf $ZSH/custom/themes ZSH/themes
cp $HOME/.tmux.conf tmux.conf

