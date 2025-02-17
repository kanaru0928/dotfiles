#!/usr/bin/env zsh

config_dir=$(cd $(dirname $0)/../kitty; pwd)

echo "kittyを設定中…"

ln -s ${config_dir} ~/.config/kitty

echo "kittyの設定完了"

