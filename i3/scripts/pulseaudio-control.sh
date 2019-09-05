#!/bin/bash

function get_default_sink {
	pactl list sinks short | grep RUNNING | awk '{print $1;}'
}

sink="$(get_default_sink)"
if [ -z "$sink" ]; then
    sink=0
fi

#[ -z "$sink" ] && exit 1

case "$1" in
	--volume-up) pactl set-sink-volume "$sink" +5%;;
	--volume-down) pactl set-sink-volume "$sink" -5%;;
	--volume-toggle) pactl set-sink-mute "$sink" toggle;;
	*) exit 1;;
esac

exit 0
