#!/usr/bin/env zsh

set -euxo pipefail
cd "$(dirname "$0")/.."

DOTFILES_ROOT="$(pwd)"

echo "Installing claude config..."

ln -s "$DOTFILES_ROOT/claude/CLAUDE.md" $HOME/.claude/CLAUDE.md || true
ln -s "$DOTFILES_ROOT/claude/settings.json" $HOME/.claude/settings.json || true
ln -s "$DOTFILES_ROOT/claude/rules" $HOME/.claude/rules || true
ln -s "$DOTFILES_ROOT/claude/skills" $HOME/.claude/skills || true

echo "Done!"
