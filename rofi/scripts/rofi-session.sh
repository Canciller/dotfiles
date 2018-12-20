#!/bin/bash

OPTION=$(echo -e \
"1. Poweroff
2. Reboot 
3. Suspend
4. Hibernate
5. Logout" | rofi -dmenu | cut -c1)

case $OPTION in
1) systemctl poweroff;;
2) systemctl reboot;;
3) systemctl suspend;;
4) systemctl hibernate;;
5) i3lock;;
esac