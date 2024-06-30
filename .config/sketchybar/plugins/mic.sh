#!/bin/bash

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

source "$CONFIG_DIR/colors.sh"

if [[ $MIC_VOLUME -eq 0 ]]; then
  sketchybar -m --set mic icon=􀊲 icon.color=$RED
elif [[ $MIC_VOLUME -gt 0 ]]; then
  sketchybar -m --set mic icon=􀊰 icon.color=$GREEN
fi 
  