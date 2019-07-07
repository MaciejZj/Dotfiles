#!/bin/sh
# Note that currently this config uses only dotfiles that are defaultly
# stored in home dir, if in the future there are any that should be stored
# in .config folder this requires modification.

GREEN="\033[1;32m"
RED="\033[1;31m"
BLUE="\033[1m\033[34m"
NOCOLOR="\033[0m"
# Grab all dotfiles in this folder
echo "Deploying dotfiles"
dotfiles=`ls -a | egrep "^\.\w+" | egrep -v "git"`

# Link dotfiles to home dir
for file in $dotfiles; do
	ln -sf ${PWD}/${file} ~/${file}
done

# Dectect if system is Mac
case $OSTYPE in
darwin*)
	echo "${GREEN}MacOS detected${NOCOLOR}"

	# Install homebrew
	echo "${BLUE}==> Installing brew${NOCOLOR}"
	if ! [ -x "`command -v brew`" ]; then   
		/usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"
	else
		echo "Homebrew installed already, skipping"
	fi
	
	# Install homebrew programs from brewfile
	echo "${BLUE}==> Installing brew formulas${NOCOLOR}"
	brew bundle --file=${PWD}/brewfile
	;;
linux-gnu)
	echo linux
	;;
*)
	echo "Did not detect compatible OS, config install abandoned"
	exit 1
esac

echo "${BLUE}==> Installing bigger${NOCOLOR}"
# Install Bigger
curl https://raw.githubusercontent.com/MaciejZj/Bigger/master/bigger.py > /usr/local/bin/bigger.py
# Install Vundle vim plugin manager
echo "${BLUE}==> Installing vundle${NOCOLOR}"
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo "${GREEN}Vundle installed successfully${NOCOLOR}"
else
	echo "Vundle already installed, skipping"
fi

echo "${BLUE}==> Installing vim plugins${NOCOLOR}"
vim +PluginInstall +qall

echo "${BLUE}==> Installing tmux-themepack${NOCOLOR}"
if ! [ -d ~/.tmux-themepack ]; then
	git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
	echo "${GREEN}Tmux-themepack installed successfully${NOCOLOR}"
else
	echo "Tmux-themepack already installed, skipping"
fi

echo "${GREEN}Config succedeed${NOCOLOR}"

