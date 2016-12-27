#!/bin/bash
main() {
	setup_zsh
	setup_vim
}

#############
# ZSH SETUP #
#############
setup_zsh() {
    $BIN_ECHO " Starting zsh installation\n"
	# First installs oh-my-zsh

	# If ZSH is not installed, then it installs that
	CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
	if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
		printf "${YELLOW}Zsh is not installed!${NORMAL} Installing ZSH now\n"

        #checks for your linux distro. If you don't use linux, whoops
		if [ -f /etc/debian_version ];  then
			$BIN_ECHO " System is running Debian Linux"
			sudo apt update
			sudo apt upgrade
			sudo apt install zsh
		elif [ -f /etc/SuSE-release ]; then
			$BIN_ECHO " System is running SuSE Linux"
			sudo zypper upgrade
			sudo zypper install zsh
		elif [ -f /etc/redhat-release ]; then
            $BIN_ECHO " System is running Red Hat Linux"
			sudo yum upgrade
			sudo yum install zsh
		else
			$BIN_ECHO " You don't have a version of Linux that this script supports sorry"
		exit 1
		fi
	fi
    $BIN_ECHO " zsh is installed\n"

    # Sets zsh as the default login shell
    $BIN_ECHO " Setting zsh as the default login shell\n"
    chsh -s /bin/zsh

	# Installs oh-my-zsh to give use those fancy prompts and stuff
    $BIN_ECHO " Installing oh-my-zsh.."
	sudo apt install curl
    $BIN_ECHO " ..\n"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # Backs up and updates the .zshrc
    $BIN_ECHO " Backing up and updating the .zshrc.."
    if[ -f ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc.old
    fi;

    $BIN_ECHO " .."
    ln -f .zshrc ~/

    $BIN_ECHO " ..\n"
    mv avit.zsh-theme ~/.oh-my-zsh/themes

    # Restarts the shell
    $BIN_ECHO " Restarting shell in zsh\n"
    zsh
}

#############
# VIM SETUP #
#############
setup_vim() {
    $BIN_ECHO " Starting setup of vim\n"

    # Installs vim plug
    $BIN_ECHO " Installing vim plug\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	# Installs vim pathogen
    $BIN_ECHO " Installing vim pathogen\n"
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    # Move to directory of script
    $BIN_ECHO " Backing up and updating the .vimrc\n"
	OLDDIR=`pwd`
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	cd $DIR

	# Backup old vimrc files
	if [ -f ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc.old
	fi;

	# Create hardlinks between local vimrc files and the actual vimrc files
	ln -f .vimrc ~/

    # Prompts the user to run :PlugInstall so they actually get to use those plugins
    vim postinstall

    # Theres a bunch of stuff that requires pathogen. I'm putting it here
    $BIN_ECHO " Installing the plugins that use pathogen\n"

    $BIN_ECHO " Installing vim-ruby\n"
    git clone git://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby

	$BIN_ECHO " Installing YouCompleteMe\n"
	if [ -f /etc/debian_version ];  then
		sudo apt-get install build-essential cmake
		sudo apt-get install python-dev python3-dev
		cd ~/.vim/bundle/YouCompleteMe
		./install.py --all
	else
		$BIN_ECHO " Since this isn't a debian system, YouCompleteMe installation isn't supported by this script.\n"
	fi

	# Return to original dir
	cd $OLDDIR
}

main
