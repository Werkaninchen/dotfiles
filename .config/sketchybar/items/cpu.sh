#!/bin/bash

cpu_percent=(
  label.font="$FONT:Heavy:12"
  label=CPU
  y_offset=0
  padding_right=0
  width=55
  icon.drawing=off
  update_freq=4
  mach_helper="$HELPER"
)


sketchybar                                       \
           --add item cpu.percent right          \
           --set cpu.percent "${cpu_percent[@]}" \
