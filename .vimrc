call plug#begin('~/.vim/plugged')

" ####################
" # Makes Vim Pretty #
" ####################

"vim-airline/vim-airline: Vim Airline"
Plug 'vim-airline/vim-airline'

"Best colorscheme NA
Plug 'ywjno/vim-tomorrow-theme'

" Highlight parentheses
Plug 'kien/rainbow_parentheses.vim'

" ####################
" # Makes Vim Easier #
" ####################

"UltiSnips
Plug 'SirVer/ultisnips'

"vim-signatur
Plug 'kshenoy/vim-signature'

"Make commenting easier
Plug 'tpope/vim-commentary'

"Git
Plug 'tpope/vim-fugitive'

"Trees don't look completely hideous
Plug 'scrooloose/nerdtree'

"Git diff signs on the left of the screen
Plug 'airblade/vim-gitgutter'

" ##################################
" # Useful stuff for all languages #
" #################################

"Easy Align
Plug 'junegunn/vim-easy-align'

"Automatic inserting of delimiters
Plug 'Raimondi/delimitMate'

"Syntax checking for files
Plug 'scrooloose/syntastic'

" #############
" # PHP Stuff #
" #############

"PHP Omnicomplete
Plug 'shawncplus/phpcomplete.vim',{'for':'php'}

" Handlebars syntax highlighting and filetype detection
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }

" ############
" # JS Stuff #
" ############

" Better syntax highlighting for JS
Plug 'pangloss/vim-javascript'

" Much more robust autocompletion for JS
Plug '1995eaton/vim-better-javascript-completion'

" ##############
" # Ruby Stuff #
" ##############

" Slim syntax highlighting
Plug 'slim-template/vim-slim'

" Makes your ruby code match standard when you save
Plug 'vim-rubyformat'

" Rails
Plug 'tpope/vim-rails'

" Ruby end of line matching
Plug 'tpope/vim-endwise'

" #############
" # SQL Stuff #
" #############

" Auto capitalization of SQL keyword when in SQL files
Plug 'hjkatz/sql_iabbr', { 'for': 'sql' }

call plug#end()

"Pathogen Stuff for YouCompleteMe

execute pathogen#infect()

"####################
"# GENERAL SETTINGS #
"####################

"map semicolon to colon
nmap ; :

"select colorscheme
colorscheme ron

"turn on line numbering
set number
set relativenumber

"bells
set vb
set noerrorbells

"show commands being typed
set showcmd

"show matching delimiters
set showmatch

"Smart indenting
set autoindent

"Show cursor position
set ruler

" Set paste mode
set pastetoggle=<F6>

"Set a dark background
set background=dark

syntax enable
let g:solarized_termcolors=256
colorscheme Tomorrow-Night

" Toggle line numbers with F4
noremap <F4> :set invnumber invrelativenumber<CR>

" Convert tabs to 4 spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

" For ruby on rails dev automatically changes the line spacing
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

" Deletes all trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

" Set auto and smart indent, as well as handle curly brace cursor placement
" set autoindent
set smartindent
imap <C-Return> <CR><CR><C-o>k<Tab>

" Keep 4 lines at bottom of screen below the cursor
set scrolloff=4

" return to same line when reopening a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Persistent undo

if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Improve searching to highlight and move cursor as you type your search
set incsearch
set hlsearch

"###################
"# Powerline Setup #
"###################
if has('gui_running')
    set guifont=Menlo\ for\ Powerline\ RegularForPowerline\ 10
endif

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"vim-airline setting"
set laststatus=2

"set encoding"
set encoding=utf-8

" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

"################
"# Plugin Setup #
"################

"===================================================================================================

" Git Gutter

" Git gutter on by default
let g:gitgutter_enabled = 1

" Git gutter update on buffer
let g:gitgutter_eager = 1

"===================================================================================================

" YouCompleteMe
if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
        \ ]

"===================================================================================================

" RainbowParentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3' ],
    \ ['Darkblue',    'SeaGreen3'  ],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3' ],
    \ ['darkcyan',    'RoyalBlue3' ],
    \ ['darkred',     'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3' ],
    \ ['gray',        'RoyalBlue3' ],
    \ ['black',       'SeaGreen3'  ],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3' ],
    \ ['darkcyan',    'SeaGreen3'  ],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3' ],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"===================================================================================================

" Syntastic
source /etc/profile.d/vimrc/plugins/syntastic.vim

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_auto_jump                = 3
let g:syntastic_check_on_wq              = 0
let g:syntastic_auto_jump                = 1
let g:syntastic_error_symbol             = "✗"
let g:syntastic_style_error_symbol       = "✗"
let g:syntastic_warning_symbol           = "⚠"
let g:syntastic_style_warning_symbol     = "⚠"
let g:syntastic_typescript_checkers      = ["tslint"]
let g:syntastic_typescript_tslint_args   = "--config ~/.tslint.json"
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["typescript"] }
let g:syntastic_eruby_ruby_quiet_messages =
  \ {'regex': 'possibly useless use of a variable in void context'}

au Filetype javascript let g:syntastic_aggregate_errors=1
au Filetype php let g:syntastic_aggregate_errors=0
au Filetype perl let g:syntastic_aggregate_errors=0
au Filetype perl nnoremap <silent> <F7> :call PerlTidy()<CR>

"===================================================================================================

" EasyAlign
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters =
    \ {
    \ 's': {
    \       'pattern': 'C[a-z]',
    \       'left_margin': 1,
    \       'right_margin': 0,
    \       'align': 'r'
    \   },
    \ '{': {
    \       'pattern':      '[}]',
    \       'left_margin':  0,
    \       'right_margin': 0,
    \       'stick_to_left':0
    \   },
    \ '}': {
    \       'pattern':      '[}]',
    \       'left_margin':  1,
    \       'right_margin': 0,
    \       'stick_to_left':0
    \   },
    \ '[': {
    \       'pattern':       ']',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ ']': {
    \       'pattern':       ']',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '(': {
    \       'pattern':       ')',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ ')': {
    \       'pattern':       ')',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '<': {
    \       'pattern':       '<',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ '?': {
    \       'pattern':       '[?]',
    \       'left_margin':   0,
    \       'right_margin':  0,
    \       'indentation':   's',
    \       'align':         'l'
    \      },
    \ ':': {
    \       'pattern':       ':',
    \       'left_margin':   1,
    \       'right_margin':  1,
    \       'stick_to_left': 0
    \      },
    \ '>': {
    \       'pattern':       '<',
    \       'left_margin':   1,
    \       'right_margin':  0,
    \       'stick_to_left': 0
    \      },
    \ }

"===================================================================================================
