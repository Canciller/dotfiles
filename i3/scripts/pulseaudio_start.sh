#!/bin/bash
sink_no="$1"

[ -n "$sink_no" ] || exit 1
[[ "$sink_no" =~ ^[0-9]+$ ]] || exit 2

exit_code=0
function check_pulseaudio {
	pulseaudio --check
	return $?
}

check_pulseaudio
[ $exit_code -eq 0 ] || pulseaudio --daemonize &>/dev/null

check_pulseaudio
[ $exit_code -eq 0 ] || exit 3

pactl list sinks short | grep -e ^$sink_no &>/dev/null
exit_code=$?
[ $exit_code -eq 0 ] || exit 4

pactl set-default-sink $sink_no &>/dev/null
[ $? -eq 0 ] || exit 5

exit 0
