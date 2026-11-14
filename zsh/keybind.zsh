bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^[e' edit-command-line
