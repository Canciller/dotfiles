show=$1
[ -z $show ] && show=drun

. getdpi

rofi -dpi $(getdpi_f) -show $show -matching regex
