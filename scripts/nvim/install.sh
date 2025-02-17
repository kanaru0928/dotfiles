#!/usr/bin/env zsh

config_dir=$(cd $(dirname $0)/../../nvim; pwd)

echo "nvimを設定中…"

ln -s ${config_dir} ~/.config/nvim

echo "nvimの設定完了"

