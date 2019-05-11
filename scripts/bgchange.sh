#!/bin/sh
rm ~/.config/zathura/zathurarc

if [ $(grep -c 'set background=light' $HOME/.vimrc) -ne 0 ]; then
	sed -i 's/${colors.base3}/${colors.base03}/g ; s/${colors.base0}/${colors.base00}/g' ~/.config/polybar/config 
	sed -i 's/foreground = #657b83/foreground = #839496/g ; s/background = #fdf6e3/background = #002b36/g ; s/cursor = #586e75/cursor = #93a1a1/g ; s/foreground_bold = #073642/foreground_bold = #eee8d5/g' ~/.config/termite/config
	sed -i 's/set background=light/set background=dark/g' ~/.vimrc
	feh --bg-scale ~/Pictures/wallpaper-dark.jpg 
	ln -s ~/.config/zathura/zathurarc-dark ~/.config/zathura/zathurarc
else	
	sed -i 's/${colors.base03}/${colors.base3}/g ; s/${colors.base00}/${colors.base0}/g' ~/.config/polybar/config 
	sed -i 's/foreground = #839496/foreground = #657b83/g ; s/background = #002b36/background = #fdf6e3/g ; s/cursor = #93a1a1/cursor = #586e75/g ; s/foreground_bold = #eee8d5/foreground_bold = #073642/g' ~/.config/termite/config
	sed -i 's/set background=dark/set background=light/g' ~/.vimrc
	feh --bg-scale ~/Pictures/wallpaper-light.jpg
	ln -s ~/.config/zathura/zathurarc-light ~/.config/zathura/zathurarc
fi
