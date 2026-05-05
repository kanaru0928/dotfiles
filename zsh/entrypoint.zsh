cd "$(dirname "$0")"

if [ -f ./aliases.zsh ]; then
    source ./aliases.zsh
fi

if [ -f ./keybind.zsh ]; then
    source ./keybind.zsh
fi

cd - > /dev/null
