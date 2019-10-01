#!/bin/bash

dotfiles_dir="$(pwd)"
backup_dir="$HOME/.dotfiles.backup"
config_dir="$HOME/.config"

ignore_suffix=".ignore"

dotfiles_list=(
    xfce4/terminal/terminalrc::copy
    fonts:"$HOME/.local/share/fonts"
    qutebrowser
    compton
    xorg/xprofile:"$HOME/.xprofile"
    bin:"$HOME/.local/bin"
    rofi
    polybar
    i3
    nvim
    zsh/zshrc:"$HOME/.zshrc"
    zsh/zshenv:"$HOME/.zshenv"
)

function usage() {
    echo "usage:$(basename $0) [-option]">&2
    echo "">&2
    echo "options:">&2
    echo "    -h, --help Print this message">&2
    echo "    -i     Install all dotfiles">&2
    echo "    -r     Restore old dotfiles">&2
}

function install_file() {
    local file="$1"

    local destination="$2"
    local destination_dir="$(dirname "$destination")"

    local install_method="$3"

    [ -z "$file" -o -z "$destination" -o -z "$install_method" ] && return 1

    if ! [ -d "$destination_dir" ]; then
        ! mkdir -p "$destination_dir" && error "[error] mkdir -p $destination_dir" && return 1
        succ "[ok] mkdir -p $destination_dir"
    fi

    local file_final="$(readlink -f $file)"

    if [ -e "$destination" ]; then
        if [ -h "$destination" -a "$(readlink -f "$destination")" = "$file_final" ]; then
            info "[info] ${file_final#"$dotfiles_dir/"} skipping, already installed"
            return 0
        fi
        # backup
        warn "[warn] removing $destination"
    else
        ! eval "$install_method \"$file_final\" \"$destination\" &>/dev/null" && error "[error] $install_method $file_final $destination" && return 1
        succ "[ok] $install_method $file_final $destination"
    fi
}

function install_recursive() {
    local file="$1"
    [ -z "$file" ] && return 1

    local destination="$2"
    [ -z "$destination" ] && return 1

    local install_method="$3"

    case "$file" in
        *$ignore_suffix) warn "[warn] ignoring $(readlink -f "$file")" && return;;
        *)
    esac

    if [ -d "$file" ]; then
        cd "$file" || return 1
        for F in $(ls -A .); do 
            install_recursive "$F" "$destination/$F" "$install_method"
        done
        cd .. || return 1
    else
        install_file "$file" "$destination" "$install_method" && return 1
    fi
}

function install() {
    for d in "${dotfiles_list[@]}"; do
        IFS=":" read -ra D <<< "$d"

        local dotfile="${D[0]}"
        local destination="${D[1]}"
        local install_method="${D[2]}"

        [ -e "$dotfile" ] || continue
        [ -z "$destination" ] && destination="$config_dir/$dotfile"

        case "$install_method" in
            copy) install_method=cp;;
            *) install_method="ln -s"
        esac

        install_recursive "$(expand_path "$dotfile")" "$(expand_path "$destination")" "$install_method"
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
