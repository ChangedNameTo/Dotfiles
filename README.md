Dotfiles
========

My configuration dotfiles for both vim and zsh.

The .zshrc requires oh-my-zsh to work correctly (bundled in the installation scripts).

Also requires powerline fonts for the .vimrc and .zshrc to work correctly

Installation
------------
If you don't have zsh on your machine this takes care of it all for you. Will install both the .zshrc and the .vimrc. Creates backups in case you think my stuff sucks.

    git clone https://github.com/ChangedNameTo/Dotfiles.git ~/.ChangedNameTo-dotfiles; ~/.ChangedNameTo-dotfiles/setup.sh

If you just want the .zshrc

    git clone https://github.com/ChangedNameTo/Dotfiles.git ~/.ChangedNameTo-dotfiles; ~/.ChangedNameTo-dotfiles/zsh_setup.sh

If you just want the .vimrc

    git clone https://github.com/ChangedNameTo/Dotfiles.git ~/.ChangedNameTo-dotfiles; ~/.ChangedNameTo-dotfiles/vim_setup.sh
    
Vim Plugins
-----------
Like my plugins but hate me, or just interested in what magic is bundled? Go find the github repos for these:
* vim-airline/vim-airline
* ywjno/vim-tommorrow-theme
* kien/rainbow_parentheses.vim
* SirVer/ultisnips
* kshenoy/vim-signature
* tpope/vim-commentary
* tpope/vim-fugitive
* scroolose/nerdtree
* airblade/vim-gitgutter
* junegunn/vim-easy-align
* Raimondi/delimitMate
* scrooloose/syntastic
* shawncplus/phpcomplete.vim
* mustache/vim-mustache-handlebars
* pangloss/vim-javascript
* 1995eaton/vim-better-javascript-completion
* slim-template/vim-slim
* radoskyb/vim-rubyformat
* tpope/vim-rails
* tpope/vim-endwise

Screenshots
-----------
zsh prompt:

![ZSH](zsh.png?raw=true "zsh prompt screenshot")

vim prompt:

![VIM](vim.png?raw=true "vim setup screenshot")

