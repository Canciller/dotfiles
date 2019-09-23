show=$1
[ -z $show ] && show=drun

source helpers

rofi -dpi $(get_dpi) -show $show -matching regex
