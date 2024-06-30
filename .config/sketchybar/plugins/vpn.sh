#!/bin/bash

update() {
    VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

    if [[ $VPN != "" ]]; then
      sketchybar -m --set vpn icon=$VPN_CONNECTED \
                          label="$VPN" \
                          drawing=on
    else
      sketchybar -m --set vpn drawing=off
    fi
}


case $SENDER in 
	"vpn_changed") update
		;;
	"mouse.clicked") click
		;;
esac
