filetype plugin indent on
syntax on

set autoindent
set expandtab
set tabstop       =4
set softtabstop   =4
set shiftwidth    =4
set shiftround

set backspace 	  =indent,eol,start
set hidden
set laststatus	  =2
set display	  =lastline

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
set synmaxcol     =500

set splitbelow
set splitright

set cursorline
set wrapscan
set report	      =0
set foldmethod    =manual

set conceallevel  =2
set concealcursor =niv

set textwidth      =120
set wrap linebreak nolist
set formatoptions -=t
set inccommand     =nosplit

set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
set noswapfile
set backupdir    -=.
set shada         ='100

set shortmess     =Ic
set cmdheight     =1
set updatetime    =300
set signcolumn    =number
set colorcolumn   =120

set complete-=i
set smarttab
set nrformats-=octal
set incsearch
set ruler
set wildmenu
set wildmode=list:full
set wildignorecase
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

set path            =.,,**

set background=dark
set termguicolors

runtime macros/matchit.vim

let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

set guicursor=n-v-c:block,i-ci-ve:hor20blinkon250,r-cr:ver20blinkon250,o:hor50
            \,sm:block-blinkwait175-blinkoff150-blinkon175

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

let mapleader   ="\<Space>"
au VimLeave * set guicursor=a:hor20-blinkon1
au filetype php :iabbrev dst declare(strict_types=1);

call plug#begin('~/.config/nvim/plugins') " https://github.com/junegunn/vim-plug
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-php-manual', {'for': 'php'}
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'branch': 'master', 'do': 'composer install --no-dev -o'}
Plug 'honza/vim-snippets'
Plug 'FooSoft/vim-argwrap'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'vim-vdebug/vdebug'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

let g:airline_theme                       ='gruvbox'
let g:gruvbox_contrast_dark               ='hard'
let g:gruvbox_invert_selection            ='0'
colorscheme gruvbox

let g:php_manual_online_search_shortcut   ='<leader>m'
let g:ultisnips_php_scalar_types          =1

map <leader>w :ArgWrap<CR>

highlight ExtraWhitespace guibg           =#073642
nnoremap <Leader>wa :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wo :match<CR>:nohlsearch<CR>
map <Leader>rw :%s/\s\+$//<CR>

tnoremap <Esc>  <C-\><C-n>

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

map <Leader>1 :CocDisable<CR>:ALEDisable<CR>
map <Leader>0 :CocEnable<CR>:ALEEnable<CR>

let g:netrw_liststyle     =0
let g:netrw_liststyle     =3
let g:netrw_browse_split  =4
let g:netrw_winsize       =30

let g:tagbar_width        =25
nmap <Leader>- :TagbarToggle<CR>

let g:NERDSpaceDelims = 1

let g:vdebug_options                    ={}
let g:vdebug_options.ide_key            ='vim'
let g:vdebug_options.break_on_open      =1
let g:vdebug_options.port               =9000
let g:vdebug_options.host               ='127.0.0.1'
let g:vdebug_options.watch_window_style ='compact'
let g:vdebug_options.server             =''

let g:vdebug_features                   ={}
let g:vdebug_features.max_children      =128

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

autocmd FileType php set iskeyword+=$
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

command! MakeTags !ctags -R --exclude=.git  --exclude=bin --exclude=var --exclude='*.min.js' --exclude='*.min.css'
"  ^] 	jump to tag under cursor; g^] 	for ambiguos tags; ^t]	jump back to the tag stack

" help ins-completion reads also from tags file
" ^n type var<ctrl>n

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <tab>
      " \ pumvisible() ? "\<c-n>" :
      " \ <sid>check_back_space() ? "\<tab>" :
      " \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nnoremap <leader>rr :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
