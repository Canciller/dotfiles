#!/bin/bash

pulseaudio --check || pulseaudio --daemonize &>/dev/null
pulseaudio --check || exit 1
exit 0
