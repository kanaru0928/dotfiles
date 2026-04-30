#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd)"

echo "Installing nvim config..."

ln -s "$DOTFILES_ROOT/nvim" $HOME/.config/nvim

echo "Done!"
