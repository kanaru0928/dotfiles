#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd)"

echo "Installing starship config..."
ln -s "$DOTFILES_ROOT/starship/starship.toml" $HOME/.config/starship.toml
echo "Done!"
