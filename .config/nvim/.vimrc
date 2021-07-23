filetype plugin indent on
syntax on

set autoindent
set expandtab
set softtabstop   =4
set shiftwidth    =4
set shiftround

set backspace 	  =indent,eol,start
set hidden
set laststatus	  =2
set display	      =lastline

set number
set relativenumber
set numberwidth   =4

set noshowmode
set showcmd

set incsearch
set hlsearch 
set ignorecase
set smartcase

set lazyredraw

set splitbelow
set splitright 

set cursorline
set wrapscan
set report	      =0
set synmaxcol	    =200
set foldmethod  	=manual

set conceallevel  =2 
set concealcursor =niv

set textwidth       =120
set wrap linebreak nolist
set formatoptions  -=t

set nobackup
set nowritebackup
set undofile
set swapfile
set backupdir    -=.

set shortmess     =Ic
set cmdheight     =1
set updatetime    =300
set signcolumn    =number

set complete-=i
set smarttab
set nrformats-=octal
set incsearch
set ruler
set wildmenu
set display+=lastline
set title
set encoding=utf-8
set formatoptions   +=j

set autoread
set history         =1000
set tabpagemax      =50
set sessionoptions  -=options
set viewoptions     -=options
set scrolloff       =3
set sidescrolloff   =5

set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

runtime macros/matchit.vim

set guicursor=n-v-c:block,i-ci-ve:hor20blinkon250,r-cr:ver20blinkon250,o:hor50
            \,sm:block-blinkwait175-blinkoff150-blinkon175

let mapleader   ="\<Space>"
au VimLeave * set guicursor=a:hor20-blinkon1
au filetype php :iabbrev dst declare(strict_types=1);

call plug#begin('~/.vim/plugged') " https://github.com/junegunn/vim-plug
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-php-manual', {'for': 'php'}
Plug 'preservim/nerdcommenter'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'develop', 'do': 'composer install --no-dev -o'}
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'FooSoft/vim-argwrap'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'vim-vdebug/vdebug'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

let g:airline_theme='gruvbox'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'
colorscheme gruvbox

let g:php_manual_online_search_shortcut = '<leader>m'

map <leader>w :ArgWrap<CR>

highlight ExtraWhitespace guibg=#073642
nnoremap <Leader>wa :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wo :match<CR>:nohlsearch<CR>
map <Leader>rw :%s/\s\+$//<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
map <Leader>, :Files<CR>
map <Leader>. :Rg<CR>

nnoremap <silent> <CR>   :nohlsearch<CR>

inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
inoremap {<CR> {<CR>}<ESC>O

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_chgwin = 2
let g:netrw_bufsettings = "noma nomod nobl norwap ro nu rnu"
autocmd FileType netrw setl bufhidden=delete

let g:tagbar_width = 25
nmap <Leader>- :TagbarToggle<CR>

let g:NERDSpaceDelims = 1

let g:vdebug_options = {}
let g:vdebug_options.ide_key = 'vim'
let g:vdebug_options.break_on_open = 1
let g:vdebug_options.port = 9000
let g:vdebug_options.host = '127.0.0.1'
let g:vdebug_options.watch_window_style = 'compact'
let g:vdebug_options.server = ''

let g:vdebug_features = {}
let g:vdebug_features.max_children = 128

let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

let g:phpactorBranch = "develop" 
let g:phpactorPhpBin = "/usr/bin/php" 
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf' 
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'

nmap <Leader><Space> :PhpactorContextMenu<CR>

autocmd BufRead,BufNewFile * setlocal signcolumn=auto

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'
let g:ale_sign_column_always = 1
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'javascript': ['prettier', 'eslint'],
            \ 'vue': ['prettier', 'eslint'],
            \ 'scss': ['prettier'],
            \ 'css': ['prettier'],
            \ 'html': ['prettier'],
            \}
let g:ale_fix_on_save = 0

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 4

let g:deoplete#enable_at_startup = 1
