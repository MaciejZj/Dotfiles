# General
# Dont require typing cd
setopt auto_cd
# Enable command autocorrection
setopt correct

# History of visited directoties
# Extend dir stack size
DIRSTACKSIZE=8
# Make cd automatically push to stack
setopt autopushd 
# Swap minus and plus  
setopt pushdminus
# Push silently
setopt pushdsilent
# Push without arguments pushes current dir instead of swapping order
setopt pushdtohome

# Make ctrl+u work like in other shells (delete from cursor to beginning
# of the line, instead of deleting the whole line)
bindkey \^U backward-kill-line
# Make ctrl+ze work like in other shells (edit current command in editor)
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

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
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
case $OSTYPE in
darwin*)
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /usr/local/opt/fzf/shell/completion.zsh
	;;
linux-gnu)
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /usr/share/fzf/completion.zsh
	if [ $TERM = linux ]; then
		# Enabled only in bare tty
		PURE_PROMPT_SYMBOL=">"
	else
		# Enabled only in terminal emulators
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi
	;;
esac
# Disable underline in syntax highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
