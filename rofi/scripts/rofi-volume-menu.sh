#!/bin/bash

rofi_command="rofi-launch -theme themes/menus/android/three.rasi"

MUTED="$(pamixer --get-mute)"

active="-a 1"
if [[ $MUTED == *"true"* ]]; then
    active="-u 1"
fi

ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

chosen="$(echo -e "$options" | $rofi_command -dmenu $active -selected-row 1)"

case $chosen in
    $ICON_UP)
    pamixer -i 5
    ;;
    $ICON_DOWN)
    pamixer -d 5
    ;;
    $ICON_MUTED)
    pamixer -t
    ;;
esac