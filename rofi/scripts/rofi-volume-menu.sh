#!/bin/bash

sink="$(pulseaudio-get-running-sink)"
[ -z "$sink" ] && exit 1

rofi_command="rofi-launch -theme themes/menus/android/three.rasi"

MUTED="$(pactl list sinks | grep "Sink #$sink" -A 10 | grep "Mute" | awk '{print $2}')"

active="-a 1"
if [[ $MUTED == *"yes"* ]]; then
    active="-u 1"
fi
echo $MUTED
echo $active

ICON_UP=""
ICON_DOWN=""
ICON_MUTED=""

options="$ICON_UP\n$ICON_MUTED\n$ICON_DOWN"

chosen="$(echo -e "$options" | $rofi_command -dmenu $active -selected-row 1)"

case $chosen in
    $ICON_UP)
    pactl set-sink-volume $sink +5%
    ;;
    $ICON_DOWN)
    pactl set-sink-volume $sink -5%
    ;;
    $ICON_MUTED)
    pactl set-sink-mute $sink toggle
    ;;
esac