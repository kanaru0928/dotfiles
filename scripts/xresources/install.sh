#!/usr/bin/env zsh

config_dir=$(cd $(dirname $0)/../../xresources; pwd)

echo "xresourcesを設定中…"

ln -s ${config_dir}/.Xresources ~/

echo "xresourcesの設定完了"

