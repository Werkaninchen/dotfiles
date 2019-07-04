#!/bin/sh
rm $HOME/.config/zathura/zathurarc
rm $HOME/.config/kitty/kitty.conf

if [ $(grep -c 'set background=light' $HOME/.vimrc) -ne 0 ]; then
	sed -i 's/${colors.base3}/${colors.base03}/g ; s/${colors.base0}/${colors.base00}/g' $HOME/.config/polybar/config 
	sed -i 's/set background=light/set background=dark/g' $HOME/.vimrc
	feh --bg-scale ~/Pictures/wallpaper-dark.jpg 
	ln -s $HOME/.config/zathura/zathurarc-dark $HOME/.config/zathura/zathurarc
	kitty @ --to unix:/tmp/kitty set-colors -a $HOME/.config/kitty/kitty-dark.conf
	ln -s $HOME/.config/kitty/kitty-dark.conf $HOME/.config/kitty/kitty.conf
	sed -i "s/solarized-light/solarized_alternate/g" $HOME/.config/rofi/config
	sed -i "s/'light'/'dark'/g" $HOME/.tmux.conf
	tmux source $HOME/.tmux.conf
else	
	sed -i 's/${colors.base03}/${colors.base3}/g ; s/${colors.base00}/${colors.base0}/g' ~/.config/polybar/config 
	sed -i 's/set background=dark/set background=light/g' $HOME/.vimrc
	feh --bg-scale $HOME/Pictures/wallpaper-light.jpg
	ln -s $HOME/.config/zathura/zathurarc-light $HOME/.config/zathura/zathurarc
	kitty @ --to unix:/tmp/kitty set-colors -a $HOME/.config/kitty/kitty-light.conf
	ln -s $HOME/.config/kitty/kitty-light.conf $HOME/.config/kitty/kitty.conf
	sed -i "s/solarized_alternate/solarized-light/g" $HOME/.config/rofi/config
	sed -i "s/'dark'/'light'/g" $HOME/.tmux.conf
	tmux source $HOME/.tmux.conf
fi
