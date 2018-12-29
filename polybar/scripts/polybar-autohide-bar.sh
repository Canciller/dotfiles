#!/bin/bash

function current_resolution {
	resolution="xrandr --current | grep \"*\" | uniq | awk '{print \$1}' | cut -d 'x' -f"
}

function current_mousepos {
	local mousepos="$(xdotool getmouselocation)" || return 1

	if [ "$1" = x ]; then
		echo "$mousepos" | grep -Po '(?<=x:)\d+'
	else
		echo "$mousepos" | grep -Po '(?<=y:)\d+'
	fi

	return 0
}
