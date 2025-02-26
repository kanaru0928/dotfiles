#!/usr/bin/env zsh

config_dir=$(cd $(dirname $0)/../../hypr; pwd)

echo "hyprlandを設定中…"

ln -s ${config_dir}/myhypr.conf ~/.config/hypr/
ln -s ${config_dir}/switch.sh ~/.config/hypr/

echo "hyprlandの設定完了"

