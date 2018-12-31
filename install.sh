#!/bin/bash

dotfiles_dir="$(pwd)"
backup_dir="$HOME/.dotfiles.backup"
config_dir="$HOME/.config"

dotfiles_list=(
	i3
	nvim
	polybar
	compton
	rofi
	xfce4
	"zsh/zshrc:$HOME/.zshrc"
	"bin:$HOME/.local/bin"
)

function usage() {
	echo "usage:$(basename $0) [-option]">&2
	echo "">&2
	echo "options:">&2
	echo "    -h, --help Print this message">&2
	echo "    -i     Install all dotfiles">&2
	echo "    -r     Restore old dotfiles">&2
}

function link() {
	local file="$1"

	local destination="$2"
	local destination_dir="$(dirname "$destination")"

	[ -z "$file" -o -z "$destination" ] && return 1

	if ! [ -d "$destination_dir" ]; then
		! mkdir -p "$destination_dir" && error "Failed creating directory: '$destination_dir'" && return 1
		succ "Created directory: $destination_dir"
	fi

	local file_final="$(readlink -f $file)"

	if [ -e "$destination" ]; then
		if [ -h "$destination" -a "$(readlink -f "$destination")" = "$file_final" ]; then
			info "Already installed $(basename "$file_final")"
			return 0
		fi
		warn "Backed up $destination"
	else
		! ln -s "$file_final" "$destination"&>/dev/null && error "Failed creating symbolic link: '$(basename "$file_final")' -> '$destination'" && return 1
		succ "Created symbolic link: '$(basename "$file_final")' -> '$destination'"
	fi
}

function link_recursive() {
	local file="$1"
	[ -z "$file" ] && return 1
	
	local destination="$2"
	[ -z "$destination" ] && return 1

	if [ -d "$file" ]; then
		cd "$file" || return 1
		for F in $(ls -A .); do 
			link_recursive "$F" "$destination/$F"
		done
		cd .. || return 1
	else
		link "$file" "$destination" && return 1
	fi
}

function install() {
	for d in "${dotfiles_list[@]}"; do
		IFS=":" read -ra D <<< "$d"

		local dotfile="${D[0]}"
		local destination="${D[1]}"

		[ -e "$dotfile" ] || continue
		[ -z "$destination" ] && destination="$config_dir/$dotfile"

		link_recursive "$(expand_path "$dotfile")" "$(expand_path "$destination")"
	done
}

function uninstall() {
	return 0
}

function main() {
	case "$1" in
		-i) install;;
		-r) uninstall;;
		-h|--help) usage;;
		*) usage && return 1
	esac
}

scripts_dir="$dotfiles_dir/scripts"

. "$scripts_dir/echos.sh"
. "$scripts_dir/helpers.sh"

main $@
exit $?
