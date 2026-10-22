#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# source (relative to repo) -> destination
LINKS=(
  "zsh/zshrc:$HOME/.zshrc"
  "git/gitconfig:$HOME/.gitconfig"
)

for entry in "${LINKS[@]}"; do
  src="$DOTFILES/${entry%%:*}"
  dest="${entry#*:}"

  if [ "$(readlink "$dest" 2>/dev/null)" = "$src" ]; then
    echo "ok       $dest"
    continue
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/"
    echo "backup   $dest -> $BACKUP/"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked   $dest"
done
