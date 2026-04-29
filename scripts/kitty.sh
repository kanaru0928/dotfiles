#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0/..")"
DOTFILES_ROOT="$(pwd)"

echo "Installing kitty config..."
ln -s "$DOTFILES_ROOT/kitty" $HOME/.config/kitty
echo "Done!"
