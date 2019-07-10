#!/bin/bash
# Note that currently this config uses only dotfiles that are defaultly
# stored in home dir, if in the future there are any that should be stored
# in .config folder this requires modification.

GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1m\033[34m'
NOCOLOR='\033[0m'

# Grab all dotfiles in this folder
echo -e "${BLUE}==> Deploying dotfiles${NOCOLOR}"
dotfiles=`ls -a | egrep "^\.\w+" | egrep -v "git"`

# Link dotfiles to home dir
for file in $dotfiles; do
	ln -sf ${PWD}/${file} ~/${file}
done

# Dectect if system is Mac
case ${OSTYPE} in
darwin*)
	echo -e "${GREEN}MacOS detected${NOCOLOR}"

	# Install homebrew
	echo -e "${BLUE}==> Installing brew${NOCOLOR}"
	if ! [ -x "`command -v brew`" ]; then
		/usr/bin/ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"
		if [ $? -ne 0 ]; then
			echo -e "${RED}Failed to install homebrew, config install abandoned${NOCOLOR}"
		fi
	else
		echo "Homebrew installed already, skipping"
	fi
	
	# Install homebrew programs from brewfile
	echo -e "${BLUE}==> Installing brew formulas${NOCOLOR}"
	brew bundle --file=${PWD}/brewfile

	echo -e "${BLUE}==> Installing bigger${NOCOLOR}"
	# Install Bigger
	curl -fsSL https://raw.githubusercontent.com/MaciejZj/Bigger/master/bigger.py > /usr/local/bin/bigger.py
	if [ $? -ne 0 ]; then
		echo -e "${RED}Failed to install bigger, config will proceed${NOCOLOR}"
	fi
	;;
linux-gnu)
	echo -e "${GREEN}Linux detected${NOCOLOR}"
	if [ -x `command -v apt` ]; then
		echo -e "${GREEN}Apt-get detected${NOCOLOR}"
		# Install apps from pkglist file
		sudo apt -y install `cat pkglist`
		echo

		# Install zsh autouggesstions
		if ! [ -d /usr/local/share/zsh-autosuggestions/ ]; then
			sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/local/share/zsh-autosuggestions/
			if [ $? -ne 0 ]; then
				echo -e "${RED}Failed to install zsh-autosuggestions, config will proceed${NOCOLOR}"
			fi
		else
			echo "Zsh-autosuggestions already installed, skipping"
		fi
		# Instal zsh syntax highlighting
		if ! [ -d /usr/local/share/zsh-syntax-highlighting/ ]; then
			sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /usr/local/share/zsh-syntax-highlighting/
			if [ $? -ne 0 ]; then
				echo -e "${RED}Failed to install zsh-syntax-highlighting, config will proceed${NOCOLOR}"
			fi
		else
			echo "Zsh-syntax-highlighting already installed, skipping"
		fi

	else
		echo -e "${RED}Did not detect comatible Linux distro, config intall abandoned${NOCOLOR}"
		exit 1
	fi
	;;
*)
	echo -e "${RED}Did not detect compatible OS, config install abandoned${NOCOLOR}"
	exit 1
	;;
esac

# Install zsh prompt
echo -e "${BLUE}==> Installing pure prompt${NOCOLOR}"
sudo curl -fsSLo /usr/local/share/zsh/site-functions/prompt_pure_setup "https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh"
if [ $? -ne 0 ]; then
	echo -e "${RED}Failed to install pure prompt, config will proceed${NOCOLOR}"
fi
sudo curl -fsSLo /usr/local/share/zsh/site-functions/async "https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh"
if [ $? -ne 0 ]; then
	echo -e "${RED}Failed to install pure prompt async, config will proceed${NOCOLOR}"
fi

# Install Vundle vim plugin manager
# Vundle doesnt need reinstall prompt since it updates itself with vim
echo -e "${BLUE}==> Installing vundle${NOCOLOR}"
if ! [ -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	if [ $? -ne 0 ]; then
		echo -e "${RED}Failed to install vundle, config install abandoned${NOCOLOR}"
		exit 1
	fi
	echo -e "${GREEN}Vundle installed successfully${NOCOLOR}"
else
	echo "Vundle already installed, skipping"
fi

# Install vim
echo -e "${BLUE}==> Installing vim plugins${NOCOLOR}"
vim +PluginInstall +qall

# Install tmux
echo -e "${BLUE}==> Installing tmux-themepack${NOCOLOR}"
if ! [ -d ~/.tmux-themepack ]; then
	git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
	if [ $? -ne 0 ]; then
		echo -e "${RED}Failed to install vundle, config will proceed${NOCOLOR}"
	fi
	echo -e "${GREEN}Tmux-themepack installed successfully${NOCOLOR}"
else
	echo "Tmux-themepack already installed, skipping"
fi

echo -e "${GREEN}Config finished${NOCOLOR}"
