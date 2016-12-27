#!/bin/bash
main() {
	setup_zsh
}

#############
# ZSH SETUP #
#############
setup_zsh() {
    $BIN_ECHO " Starting just the zsh installation\n"
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

main
