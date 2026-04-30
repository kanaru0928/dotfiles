#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd)"

echo "Installing ghostty config..."
ln -s "$DOTFILES_ROOT/ghostty" $HOME/.config/ghostty
echo "Done!"
