call plug#begin('~/.vim/plugged')

"vim-airline/vim-airline: Vim Airline"
Plug 'vim-airline/vim-airline'

"Make commenting easier
Plug 'tpope/vim-commentary'

"Git
Plug 'tpope/vim-fugitive'

"Easy Align
Plug 'junegunn/vim-easy-align'

"Automatic inserting of delimiters
Plug 'Raimondi/delimitMate'

"Best colorscheme NA
Plug 'ywjno/vim-tomorrow-theme'

"Syntax checking for files
Plug 'scrooloose/syntastic'

"UltiSnips
Plug 'SirVer/ultisnips'

"vim-signatur
Plug 'kshenoy/vim-signature'

"PHP Omnicomplete
Plug 'shawncplus/phpcomplete.vim',{'for':'php'}

" Highlight parentheses
Plug 'kien/rainbow_parentheses.vim'

" Handlebars syntax highlighting and filetype detection
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }

call plug#end()

"Pathogen Stuff for YouCompleteMe

execute pathogen#infect()

"GENERAL SETTINGS

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

"Convert tabs to 4 spaces
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4

"Deletes all trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

"Set auto and smart indent, as well as handle curly brace cursor placement
set autoindent
set smartindent
imap <C-Return> <CR><CR><C-o>k<Tab>

"Keep 4 lines at bottom of screen below the cursor
set scrolloff=4

"Improve searching to highlight and move cursor as you type your search
set incsearch
set hlsearch

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

" YouCompleteMe
if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
        \ ]

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

 " Syntastic
let $PATH.=';/etc/profile.d/vim/neadwerx_plugins/syntastic_checkers/'

let g:syntastic_javascript_checkers = ['jshint', 'jscs']

let g:syntastic_javascript_jshint_args = '--config /etc/profile.d/vim/neadwerx_plugins/syntastic_checkers/jshintrc --verbose'
let g:syntastic_javascript_jscs_args = '--config /etc/profile.d/vim/neadwerx_plugins/syntastic_checkers/jscsrc --verbose'
let g:syntastic_php_phpcs_args = '--standard=NeadWerx'

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'perlcritic']
let g:syntastic_perl_perlcritic_args = '--profile /etc/profile.d/vim/neadwerx_plugins/syntastic_checkers/perlcriticrc'
let g:syntastic_perl_perlcritic_thres = 3

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

nnoremap <F7> :SyntasticCheck<CR>:let b:syntastic_mod="active"<CR>

" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction

" toggle syntastic error list
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
        " No location/quickfix list shown, open syntastic error location panel
        " Turn on syntastic
        let b:syntastic_mode="active"
        call SyntasticCheck()
    else
        " Turn off syntastic
        let b:syntastic_mode="passive"
        call SyntasticReset()
        lclose
    endif
endfunction

" run perltidy on the current file and turn on syntastic
function! PerlTidy()
    write!
    setlocal autoread
    silent !perltidy --profile='/etc/profile.d/vim/neadwerx_plugins/syntastic_checkers/perltidyrc' %:p
    redraw!
    call SyntasticCheck()
    let b:syntastic_mode="active"
    redraw!
endfunction

nnoremap <silent> <F8> :<c-u>call ToggleErrors()<CR>

" <Home> and <End> go up and down the location list and wrap around
nnoremap <silent> <Home> :call WrapCommand('up', 'l')<CR>
nnoremap <silent> <End>  :call WrapCommand('down', 'l')<CR>

au Filetype javascript let g:syntastic_aggregate_errors=1
au Filetype php let g:syntastic_aggregate_errors=0
au Filetype perl let g:syntastic_aggregate_errors=0
au Filetype perl nnoremap <silent> <F7> :call PerlTidy()<CR>


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
