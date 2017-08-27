" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'zeis/vim-kolor'
Plug 'powerline/powerline'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim' 
Plug 'SirVer/ultisnips' 
"Plug 'honza/vim-snippets' 
" Initialize plugin system
call plug#end()

syntax on
filetype plugin indent on
syntax enable
let mapleader = ','

set encoding=utf-8
set relativenumber
set ff=unix
set noswapfile
set laststatus=2
set autochdir                 " Automatically change to the directory of the file open.

" Mapping for general purpose.
nmap <leader>n :set number<cr>
nmap <leader>nn :set nonumber<cr>
nmap <leader>rn :set relativenumber<cr>
nmap <leader>z ZZ
map <leader>w <Esc>:w<CR>
inoremap <leader>w <Esc>:w<CR>
map <leader>q <Esc>:q<CR>
map <leader>d <Esc>:bd<CR>

" Create shortcut to edit vimrc.
nmap <leader>ev :e $MYVIMRC<cr>

" Syntax check.
nmap <leader>sc :SyntasticCheck<cr>
nmap <leader>st :SyntasticToggleMode<cr>

" Manage the buffer.
nmap <leader>h :bprevious<cr>
nmap <leader>l :bnext<cr>

" Help to moving around.
nmap <leader>yw "ayw
nmap <leader>'  vi'
nmap <leader>"  vi"
nmap <leader>>  vi>
nmap <leader>)  vi)
nmap <leader>]  vi]
nmap <leader>}  vi}

" CtrlP
nmap <leader>p <Esc>:CtrlP<cr>
nmap <leader>pb <Esc>:CtrlPBuffer<cr>
nmap <leader>pr <Esc>:CtrlPMRU<cr>

" Remap ; to : make life easier.
nnoremap ; :

" high light search
set hls

" set tab width
set tabstop=2
set shiftwidth=2
set expandtab

" load syntax specific configurations
au Filetype python source ~/.vim/syntax/python.vim
au Filetype php source ~/.vim/syntax/php.vim

au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.inc setfiletype php


" diable toolbar
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar


" disable nerdtree scrollbar
set guioptions+=LlRrb
set guioptions-=LlRrb

" color schemes available:
" solarized
" codeschool
" kolor

" gui theme
if has('gui_running')
  "set guifont=Inconsolata\ 14
  " set guifont=DroidSansMono\ 11
  set guifont=Monospace\ 11
  " color scheme
  set background=dark
  colorscheme evening
  " colorscheme kolor
  set lines=52 columns=160
endif

" terminal theme
if !has('gui_running')
  set guifont=DroidSansMono\ 11
  " enable 256 color terminal theme
  set t_Co=256
  "let g:solarized_termcolors = &t_Co
  "let g:solarized_termtrans = 1

  " color scheme
  colorscheme kolor
endif

"enable Ctrl-v to paste from system clipboard"
set clipboard=unnamed
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-x>     :tabclose<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>
inoremap <C-tab>   <Esc>:tabnext<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

" multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_prev_key='<C-x>'
let g:multi_cursor_skip_key='<C-z>'
let g:multi_cursor_quit_key='<Esc>'


" nerdtree
map <C-n> :NERDTreeToggle<CR>

" Quick swap slip screen.
nmap <C-L>  <C-W><C-L>
nmap <C-G>  <C-W><C-H>
nmap <C-J>  <C-W><C-J>
nmap <C-K>  <C-W><C-K>

" show hidden files
let NERDTreeShowHidden=1
" hide pyc and version control files files
let NERDTreeIgnore = ['\.pyc$','\.git$','\.svn$']

" map ii to escape key when in insert mode
imap ii <Esc>


" powerline setup
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" syntatic setup

" debugger settings
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

au BufRead,BufNewFile *.install setfiletype php

"------------Auto-Commands------------"
"
""Source vimrc automatically after saving.
autocmd BufWritePost .vimrc source %

autocmd FileType python,php,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

"" Close the window if only NerdTree left
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" load local configuration if it exists
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif

" Syntastic
" let g:syntastic_filetype_map = { 'phtml': 'php' }
" let g:syntastic_error_symbol             = '.'
let g:syntastic_mode_map = { 'mode': 'passive' } " Disable active mode by default.
" let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_error_symbol             = 'X'
let g:syntastic_warning_symbol           = '~'
let g:syntastic_aggregate_errors         = 1 " Run all linters, even if first found errors.
let g:syntastic_always_populate_loc_list = 1 " Add errors to location-list.
let g:syntastic_auto_loc_list            = 1 " Automatically open/close location-list if errors are found.
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
" let g:syntastic_css_checkers             = ['csslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args   = ['--config', '/Users/yanhu/Code/fcl-account-api-gateway/.eslintrc']
let g:syntastic_html_checkers            = [] " Disable HTML checkers.
"let g:syntastic_javascript_checkers      = ['jshint']
let g:syntastic_javascript_jshint_args   = ['--config', '/home/vagrant/.jshintrc']
let g:syntastic_sh_checkers              = ['sh', 'shellcheck']
let g:syntastic_sh_shellcheck_args       = '--exclude=SC2155,SC2032,SC1090,SC2033' " Ignore declare and assign on same line.
let g:syntastic_php_checkers             = ['php', 'phpcs']
let g:syntastic_php_phpcs_args           = ['--standard=/home/vagrant/phpcs.xml']
let g:syntastic_python_checkers          = ['pylint', 'pep8', 'python']
let g:syntastic_scss_checkers            = ['scss_lint']
let g:syntastic_text_checkers            = ['proselint']
let g:syntastic_vim_checkers             = ['vint']
let g:syntastic_json_checkers            = ['jsonlint', 'jsonval']
let g:syntastic_stl_format               = '[%E{E: %fe #%e}%B{, }%W{W: %fw #%w}]'
" let g:syntastic_cucumber_checkers        = ['cucumber', 'gherkin-lint']
let g:syntastic_cucumber_checkers        = ['cucumber']
let g:syntastic_cucumber_cucumber_args   = '--profile syntastic'
" let g:syntastic_cucumber_cucumber_exe    = '/usr/local/bin/gherkin-lint'

" Airline
 let g:airline_theme = 'luna'
" let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'badwolf'
" let g:airline_theme = 'wombat'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = '.'
let g:airline_powerline_fonts                      = 1
let g:airline_enable_syntastic                     = exists(':SyntasticCheck')
let g:airline#extensions#syntastic#enabled         = exists(':SyntasticCheck')
let g:airline#extensions#branch#enabled            = 1
let g:airline#extensions#bufferline#enabled        = 1
let g:airline#extensions#capslock#enabled          = 1
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#hunks#enabled             = 1
let g:airline#extensions#tabline#enabled           = 1
let g:airline#extensions#tabline#fnamemod          = ':t' " Only show filename.
let g:airline#extensions#undotree#enabled          = 1
let g:airline#extensions#whitespace#enabled        = 1

" CtrlP setting
let g:ctrlp_working_path_mode = 'c'

" Ag setting
let g:ackprg = 'ag --nogroup --nocolor --column'

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/.config/nvim/mySnippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:UltiSnipsSnippetsDir="~/.config/nvim/mySnippets"
let g:UltiSnipsSnippetDirectories="~/.config/nvim/mySnippets"
