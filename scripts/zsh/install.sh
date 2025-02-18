#!/usr/bin/env zsh

config_dir=$(cd $(dirname $0)/../../zsh; pwd)

echo "zshを設定中…"

ln -s ${config_dir}/.zshrc ~/
ln -s ${config_dir}/.p10k.zsh ~/

curl -fsSLo /.config/zsh https://raw.githubusercontent.com/catppuccin/zsh-syntax-highlighting/refs/heads/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

echo "zshの設定完了"

