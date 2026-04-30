#!/usr/bin/env zsh

set -euo pipefail
cd "$(dirname "$0")/.."

DOTFILES_ROOT="$(pwd)"

echo "Installing claude config..."

ln -s "$DOTFILES_ROOT/claude/CLAUDE.md" $HOME/.claude/CLAUDE.md
ln -s "$DOTFILES_ROOT/claude/settings.json" $HOME/.claude/settings.json

echo "Done!"
