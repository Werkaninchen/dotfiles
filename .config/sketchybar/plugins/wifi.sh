#!/bin/bash

update() {
  source "$CONFIG_DIR/icons.sh"
  INFO="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: '  '/ SSID: / {print $2}')"
  
#!/bin/sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')


###LABEL="$INFO ($(ipconfig getifaddr en0))"

if [[ $IS_VPN != "" ]]; then
	COLOR=$CYAN
	ICON=$VPN_CONNECTED
	LABEL="VPN $IP_ADDRESS"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$GREEN
	ICON=$WIFI_CONNECTED
	LABEL="$INFO $IP_ADDRESS"
else
	COLOR=$RED
	ICON=$WIFI_DISCONNECTED
	LABEL="Not Connected"
fi



  sketchybar --set $NAME icon.color=$COLOR icon="$ICON" label="$LABEL"
}

click() {
  CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
}

case "$SENDER" in
  "wifi_change") update
  ;;
  "mouse.clicked") click
  ;;
esac
