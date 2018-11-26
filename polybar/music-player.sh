#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
player_artist="`playerctl metadata artist`" 
player_title="`playerctl metadata title`"

case $1 in
"data")
    artist=$player_artist
    title=$player_title

    output="$title"
    [ -n "$artist" ] && output="$artist - $title"
    echo "$output"
;;
"status")
    if [ "$player_status" = "Playing" ]; then   
        echo  
    elif [ "$player_status" = "Paused" ]; then
        echo 
    fi
;;
"toggle")
    playerctl play-pause
;;
"stop")
    playerctl stop
;;
"next")
    playerctl next
;;
"prev")
    playerctl previous
;;
*)
    echo ""
;;
esac
