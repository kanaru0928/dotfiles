#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0/..")"
DOTFILES_ROOT="$(pwd)"

echo "Installing zsh config..."

if [ -f $HOME/.zshrc ]; then
    echo "$HOME/.zshrc already exists. Please add manually following content to the top of your .zshrc:"
    cat $DOTFILES_ROOT/zsh/.zshrc
else
    cp "$DOTFILES_ROOT/zsh/.zshrc" $HOME/.zshrc
    echo "Done!"
fi
