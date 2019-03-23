#!/bin/bash

layout_info_dir="/usr/share/X11/xkb/symbols"

function current_layout {
	local layout="$(setxkbmap -query | grep layout)" || return 1

	[ -z "$layout" ] && return 1

	if [[ "$layout" =~ layout:\ *(([a-z]|[A-Z]|[0-9]|-|_)+) ]]; then
		layout="${BASH_REMATCH[1]}"
		[ -z "$layout" ] && return 1
	else
		return 1
	fi

	echo -n "$layout"

	return 0
}

function list_layouts {
	local current="$(current_layout)" || return 1
	local current_layout_name=
	local list=
	
	cd "$layout_info_dir" || return 1
	
	for l in *; do 
		[ -d "$l" ] && continue

		local layout="$(grep -m1 -oP '(?<=name\[Group1\]=)\ *".+(?=")' "$l" | sed 's/\s*"//g')" || continue

		[ "$l" = "$current" ] && current_layout_name="$layout" && continue

		list="$list$l"	
		[ -n "$layout" ] && list="$list - $layout"
		list="$list\n"
	done
	
	[ -z "$current_layout_name" ] && list="$current\n$list" || list="$current - $current_layout_name\n$list"

	list="* $list"
	
	echo -ne "$list"
	return 0
}

function select_layout {
	. getdpi

	selected="$(list_layouts | rofi -dpi $(getdpi_f) -i -dmenu)" || return 1

	selected="$(echo "$selected" | grep -oP '^\w+')"

	if [ -n "$selected" ]; then
		setxkbmap "$selected" || return 1
	fi

	return 0
}

case "$1" in
	select) select_layout || exit 1;;
	list) list_layouts || exit 1;;
	*) current_layout || exit 1;;
esac

exit 0
