#!/bin/bash

pulseaudio --check || pulseaudio --daemonize
pulseaudio --check || exit 1

while ! pactl info &>/dev/null; do
	pulseaudio --kill
	pulseaudio --daemonize
done

exit 0
