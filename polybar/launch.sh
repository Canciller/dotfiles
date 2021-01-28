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

    set -a
    	[ -f "$HOME/.polybar.conf" ] && source "$HOME/.polybar.conf"
    set +a

    height="$height"\
    dpi=$(get-dpi "$monitor")\
    monitor="$monitor"\
    polybar --reload "$name" --config="$HOME/.config/polybar/config.ini"&
}

if type xrandr; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		h=$default_height
		case $m in
			*eDP*);;
			*DP*) h=54;;
		esac

        launch_bar top $h $m
        launch_bar bottom $h $m
	done
else	
    launch_bar top
    launch_bar bottom
fi
