# General
# Language
export LANG=en_US.UTF-8

# Set history length
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=100000
setopt sharehistory
setopt extendedhistory

# Enable colors for man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# Make fzf follow 16 ASCI terminal colors
export FZF_DEFAULT_OPTS='--color=16'
# Disable less history
export LESSHISTFILE=/dev/null

# Aliases
# Aliases are here and not in the .zshrc, because only .zshenv
# is sourced by the shell invoked through vim's '!' external command.
# Prompt for confirmation when overwriting files
alias cp='cp -i'
alias mv='mv -i'
# Enable colors for grep
alias grep='grep --color=auto'
# Pygmentize coloring
alias pyg='pygmentize -f terminal'
# Dir history alias
alias dh='dirs -v'
# Make sure python is python3
alias python='python3'
alias pip='pip3'

case ${OSTYPE} in
darwin*)
	# Add local sbin to PATH as brew requests
	export PATH="/usr/local/sbin:$PATH"
	# Add user's Python modules to PATH
	export PATH="$PATH:/Users/$USER/Library/Python/3.8/bin"
	# Add brew llvm to PATH
	export PATH="$PATH:/usr/local/opt/llvm/bin"
	# Disable MacOS shell state restoration which is annoying with tmux
	export SHELL_SESSIONS_DISABLE=1

	# Aliases for ls
	alias l='ls -h'
	alias la='ls -ah'
	alias ll='ls -hl'
	alias lla='ls -ahl'
	# Colors for BSD programs
	export CLICOLOR=1

	# Aliases for Bigger, installed from: https://github.com/maciejzj/bigger
	alias sc='bigger.py c'
	alias ss='bigger.py s'
	alias sm='bigger.py m'
	alias sb='bigger.py b'
	;;
linux-gnu)
	# Add user's Python modules to PATH
	export PATH="$PATH:/home/$USER/.local/bin"

	# Aliases for ls
	alias ls='ls --color=auto'
	alias l='ls -h --color=auto'
	alias la='ls -ah --color=auto'
	alias ll='ls -hl --color=auto'
	alias lla='ls -ahl --color=auto'

	# Commands for xorg programms
	# Start mupdf in inverted colors mode
	mupdf="mupdf -I"
	;;
esac
