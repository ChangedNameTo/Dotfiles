#!/bin/bash
main() {
	setup_zsh
	setup_vim
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
