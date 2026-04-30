cd "$(dirname "$0")"

if [ -f ./aliases.zsh ]; then
    source ./aliases.zsh
fi

cd - > /dev/null
