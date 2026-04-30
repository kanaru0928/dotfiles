#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd)"

echo "Installing sheldon config..."

ln -s "$DOTFILES_ROOT/sheldon" $HOME/.config/sheldon

echo "Done!"
