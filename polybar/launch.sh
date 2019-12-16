#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

default_height=35

launch_bar() {
    name="$1"
    height="$2"
    monitor="$3"

    [ -z "$name" ] && return 1
    [ -z "$height" ] && height=$default_height

    HEIGHT="$height"\
    DPI=$(get-dpi "$monitor")\
    MONITOR="$monitor"\
    BATTERY=BAT0 BATTERY_ADAPTER=AC\
    WIRELESS_INTERFACE=wlp6s0\
    polybar --reload "$name" &
}

if type xrandr; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		h=$default_height
		case $m in
			*eDP*);;
			*DP*) h=60;;
		esac

        launch_bar top $h $m
        launch_bar bottom $h $m
	done
else	
    launch_bar top
    launch_bar bottom
fi
