
mic=(
    display=active
    label=muted
)
sketchybar -m --add item mic e \
              --set mic update_freq=3 \
              --set mic script="$PLUGIN_DIR/mic.sh" \
              --set mic click_script="$PLUGIN_DIR/mic_click.sh"