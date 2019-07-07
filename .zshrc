# General
# Dont require typing cd
setopt auto_cd
# Enable command autocorrection
ENABLE_CORRECTIO="true"

# History of visited directoties
# Extend dir stack size
DIRSTACKSIZE=8
# Make cd automatically push to stack
setopt autopushd 
# Swap minus and plus  
setopt pushdminus
# Push silently
setopt pushdsilent
# Push without argumetns pushes current dir instead of swapping order
setopt pushdtohome
# Dir hisotory alias
alias dh='dirs -v'

# Autocompletion
# Enble colors in zsh completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Enable menu box in zsh completion
zstyle ':completion:*' menu yes select
# Enable completion
autoload -Uz compinit
compinit
# When completion is loading show dots
COMPLETION_WAITING_DOTS="true"

# Plugins
# Prompt theme Pure, installed from: https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure
# Fish like autosuggestion plugin, installed from: https://github.com/zsh-users/zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Fish like syntax coloring plugin, installed from: https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Disable underline in syntax highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
