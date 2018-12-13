#!/bin/bash

dotfiles_dir="$PWD"
default_install_dir="$CONFIG"

backup_dirname=backup

install_list=(
	i3
	nvim
	polybar
	compton
	rofi
	xfce4
	"zsh/zshrc:$HOME/.zshrc"
)

function print {
	local message="$1"
	local fg_color="$2"
	[ -z "$fg_color" ] && fg_color=0
	echo -e "\e[${fg_color}m$message\e[0m"
}

function error {
	print "[ERROR] $1" 31
	exit 1
}

function warning {
	print "[WARNING] $1" 33
}

function success {
	print "[OK] $1" 32
}

function info {
	print "[INFO] $1" 34
}

function debug {
	print "[DEBUG] $1" 35
}

function variable {
	[ -z "$1" ] && echo -n && return
	eval "echo \"$1=\\\"\$$1\\\"\""
}

function absolute_path {
	[ -z "$1" ] && return 1
	case "$1" in
		/*) return 0;;
		*) return 1;;
	esac
}

function get_absolute_path {
	[ -z "$1" ] && return 1
	path="$(readlink -f "$1")"
	[ -n "$path" ] && echo "$path" || echo "$1"
}

function make_link {
	local dotfile="$1"
	local install_path="$2"
	local backup_dir="$3"

	if [ -d "$dotfile" ]; then
		if [ -e "$install_path" ]; then
			! [ -e "$install_path" ] && return 1
		else
			mkdir -p "$install_path"
		fi

		cd "$dotfile"
		for f in $(ls -A .); do
			make_link "$f" "$install_path/$f" "$backup_dir/$dotfile"
		done
		cd ..
	else
		local dotfile_path="$(readlink -f "$dotfile")"

		if [ -e "$install_path" ]; then
			if [ -h "$install_path" ]; then
				if [ "$(readlink -f "$install_path")" = "$dotfile_path" ]; then
					success "skipping '$dotfile_path' -> '$install_path'"
					return 0
				fi
			fi

			! [ -d "$backup_dir" ] && mkdir -p "$backup_dir"

			warning "moving '$install_path' -> '$backup_dir/$dotfile'"
			mv "$install_path" "$backup_dir/$dotfile"
			success "moving '$install_path' -> '$backup_dir/$dotfile'"

			ln -s $dotfile_path $install_path
			success "linking '$dotfile_path' -> '$install_path'"
		else
			[ "$(basename "$install_path")" != "$install_path" ] && mkdir -p "$(dirname "$install_path")"
			ln -s $dotfile_path $install_path
			success "linking '$dotfile_path' -> '$install_path'"
		fi
	fi

	return 0
}

function main {	
	[ -z "$dotfiles_dir" ] && error "dotfiles_dir was not specified."
	absolute_path "$dotfiles_dir" || error "$(variable dotfiles_dir) must be an absolute path."

	[ -z "$default_install_dir" ] && error "default_install_dir was not specified."
	default_install_dir="$(get_absolute_path "$default_install_dir")"
	absolute_path "$default_install_dir" || error "$(variable default_install_dir) must be an absolute path or relative to the current directory."
	
	info "$(variable dotfiles_dir)."
	info "$(variable default_install_dir)."

	[ -d "$dotfiles_dir" ] || error "'$dotfiles_dir' doest not exists."
	cd "$dotfiles_dir" || error "cd '$dotfiles_dir' failed."

	debug "$(variable PWD)."

	for i in "${install_list[@]}"; do
		IFS=":" read -ra f <<< "$i"

		local dotfile="${f[0]}"	
		local install_path="${f[1]}"
	
		echo

		[ -z "$dotfile" ] && warning "dotfile name was not specified." && continue
		[ -z "$install_path" ] && install_path="$default_install_dir/$dotfile"

		if ! absolute_path "$install_path"; then
			warning "$dotfile $(variable install_path) must be an absolute path."
			continue
		fi

		info "$(variable dotfile)."
		info "$(variable install_path)."

		! [ -e "$dotfile" ] && warning "$dotfiles_dir/$dotfile does not exists." && continue

		make_link "$dotfile" "$install_path" "$dotfiles_dir/$backup_dirname/$(date +%Y-%m-%d-%H%M%S)"
	done

	return 0
}

main "$@"
exit $?
