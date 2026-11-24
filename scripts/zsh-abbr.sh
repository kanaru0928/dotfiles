#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."
DOTFILES_ROOT="$(pwd)"

echo "Installing zsh-abbr config..."
ln -s "$DOTFILES_ROOT/zsh-abbr" $HOME/.config/zsh-abbr
echo "Done!"
