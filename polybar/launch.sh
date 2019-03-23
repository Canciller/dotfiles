#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type xrandr; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		height=35
		case $m in
			*eDP*);;
			*DP*) height=60;;
		esac

		HEIGHT=$height DPI=$(getdpi $m) MONITOR=$m polybar --reload top &
	done
else	
	polybar --reload top &
fi
