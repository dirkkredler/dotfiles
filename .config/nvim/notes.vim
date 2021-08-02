" Plugin-manager see https://github.com/junegunn/vim-plug
" Remap <Esc> to <Capslock>: `setxkbmap -option caps:swapescape`
call plug#begin('~/.config/nvim/plugins')
Plug 'tpope/vim-repeat'         " Repeat surround
Plug 'tpope/vim-commentary'     " Comment stuff out
                                " gcc        # comment out a line
                                " gc<motion> # comment out the target of a motion
                                " gcap       # comment out a paragraph
Plug 'tpope/vim-surround'       " Surround text with brackets, quotes, tags etc. (normal-mode)
                                " ds<t> = delete surrounding
                                " cs<tt> = change surrounding
                                " ys<text-object> = yank (add) surrounding
                                " In visual mode use S with surrounding
                                " 'hello' cs'" replaces ' with "
                                " <p>hello</p> cst' replaces <p> with '
                                " 'hello' ds' removes '
                                " hello world ysiw] adds [] around hello with no space
                                " hello world ysiw[ adds [] around hello with space
                                " '[ hello ] world cs]{ adds {} around hello with space
                                " '( hello  world ) yss) adds {} around the line
                                " ysis inner sentence
                                " ysip inner paragraph
                                " hello world ysiw<em> adds <em></em>
                                " ys$ adds from here to the end
                                " yss adds current line, type the yss fast!
                                " Visual-Mode plus S<p class="important">
Plug 'junegunn/vim-easy-align'  " Easy align
                                " :EasyAlign =
                                " around = first occurences
                                " around 2= second occurences
                                " around *= all occurences
                                " around \  space
                                " around 2\ second space
                                " around -\ last space
                                " around -2\  second last space
                                " <Enter><Enter>2<Space> center alignment last space
                                " around **= left/right alternating
                                "            around all occurences
                                "
                                " <Enter> switching beweend left/right/center alignment modes
                                "
                                " :EasyAlign *, = align around each comma
                                " it is possible to use regular expressions
                                " command-line fuzzy finder with
Plug 'junegunn/fzf', { 'dir': '~/.config/nvim/plugins/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'         " vim integration
Plug 'sonph/onehalf'            " Colorscheme
Plug 'itchyny/lightline.vim'    " Statusline
Plug 'mhinz/vim-startify'       " Start screen
Plug 'StanAngeloff/php.vim'     " PHP syntax for vim
Plug 'stephpy/vim-php-cs-fixer' " php-cs-fixer integration
                                " <leader>pcd :call PhpCsFixerFixDirectory()<CR>
                                " <leader>pcf :call PhpCsFixerFixFile()<CR>
Plug 'majutsushi/tagbar'        " A class outliner based on exuberant ctags
                                " :Tagbar
                                " :TagbarToggle
Plug 'lumiliet/vim-twig'        " Supports twig php templates
Plug 'phpactor/phpactor', {'branch': 'develop', 'do': 'composer install', 'for': 'php'}
                                " Intelligent code completion
                                " <Leader>u add use statement
                                " <Leader>mm call context menu
                                " <Leader>nn call navigate
                                " <Leader>o go to definition
                                " <Leader>K show information about symbol under cursor
                                " <Leader>tt transform classes in current file
                                " <Leader>cc generate new class
                                " <silent><Leader>ee extract expression
                                " <silent><Leader>em extract method
                                " :call phpactor#Update()
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/plugins/vim-snippets/snippets'
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'udalov/kotlin-vim'        " Kotlin Vim-Plugin
Plug 'rust-lang/rust.vim'       " Rustlang Vim-Plugin
Plug 'mattn/emmet-vim'          " see https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
Plug 'Yggdroot/indentLine'      " see https://github.com/Yggdroot/indentLine/blob/master/doc/indentLine.txt
Plug 'dense-analysis/ale'       " see https://github.com/dense-analysis/ale
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
call plug#end()

let g:loaded_python_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

let mapleader = "\<Space>"
"let g:user_emmet_leader_key=','
let g:php_cs_fixer_rules = "@PSR2"

"map <Leader>n :call deoplete#toggle()<CR>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

set conceallevel=2 concealcursor=niv

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark

colorscheme onehalfdark
let g:airline_theme='onehalfdark'

set guicursor=n-v-c:block,i-ci-ve:hor20blinkon250,r-cr:ver20blinkon250,o:hor50
            \,sm:block-blinkwait175-blinkoff150-blinkon175
au VimLeave * set guicursor=a:hor20-blinkon1

autocmd BufRead,BufNewFile * setlocal signcolumn=auto

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

"set noswapfile
set noshowmode
set textwidth=120
set wrap linebreak nolist
set formatoptions-=t    " auto-wrapping off
set inccommand=nosplit

runtime macros/matchit.vim

syntax enable
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set incsearch
set synmaxcol=500
set cursorline
set laststatus=2
set ruler
set wildmenu
set display+=lastline
set title
set encoding=utf-8
set formatoptions+=j

set autoread
set history=1000
set tabpagemax=50
set sessionoptions-=options
set viewoptions-=options
set scrolloff=3
set sidescrolloff=5

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tabstop=4
set shiftwidth=4
set expandtab

set hidden
set number
set relativenumber
set numberwidth=4

set ignorecase
set smartcase

set colorcolumn=

set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" endtemp

"autoclose and position cursor after
inoremap (<tab> ()
inoremap [<tab> []
inoremap {<tab> {}
"autoclose 2 lines below and position cursor in the middle
inoremap {<CR> {<CR>}<ESC>O

" Show and Remove whitespace
map <Leader>rs :%s/\s\+$//<CR>
highlight ExtraWhitespace guibg=#073642
match ExtraWhitespace /\s\+$/

" see https://github.com/junegunn/fzf.vim
" find file by filename
map <Leader>, :Files<CR>
" find file by content
map <Leader>. :Rg<CR>
"           <C-j>   prev item from matchlist
"           <C-k>   next item from matchlist
"           <CR>    open selected item
"           <C-x>   open selected item in horizontal split
"           <C-v>   open selected item in vertical split
"           <C-t>   open selected item in tab split
"           <C-c>   dismiss picker

let g:php_cs_fixer_rules = "@PSR2"
let g:php_cs_fixer_php_path = "/usr/bin/php"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 1

let g:tagbar_width = 25
nmap <Leader>- :TagbarToggle<CR>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_chgwin = 2
let g:netrw_bufsettings = "noma nomod nobl norwap ro nu rnu"
autocmd FileType netrw setl bufhidden=delete

nmap <Leader>cd :lcd %:p:h<CR>:pwd<CR>
nmap <Leader>ex :Lexplore<CR>

" remove the highlight of the last search
nnoremap <silent> <CR>   :nohlsearch<CR>
tnoremap <Esc>  <C-\><C-n>

" cycle through buffers
map <C-l> :bprev<CR>
map <C-j> :bnext<CR>

autocmd FileType php setlocal omnifunc=phpactor#Complete
set completeopt=noinsert,menuone,noselect
let g:phpactorBranch = "develop"
let g:phpactorPhpBin = "/usr/bin/php"
let g:phpactorOmniAutoClassImport = v:true
let g:phpactorInputListStrategy = 'phpactor#input#list#fzf'
let g:phpactorQuickfixStrategy = 'phpactor#quickfix#fzf'

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>oo :call phpactor#GotoDefinition()<CR>
nmap <Leader>oh :call phpactor#GotoDefinitionHsplit()<CR>
nmap <Leader>ov :call phpactor#GotoDefinitionVsplit()<CR>
nmap <Leader>ot :call phpactor#GotoDefinitionTab()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

let g:phpactorCustomMappings = [
      \ ['<Leader>cm', '<Plug>phpactorContextMenu', 'n'],
      \ ['<Leader>pn', '<Plug>phpactorNavigate', 'n'],
      \ ['<Leader>pt', '<Plug>phpactorTransform', 'n'],
    \ ]

" Python settings
map <Leader>py :!python3 %<CR>

" Php settings
map <Leader>plint :!php -l %<CR>
map <Leader>php :!php %<CR>

" Kotlin settings
map <Leader>k :!kotlinc -include-runtime % -d %:r.jar && java -jar %:r.jar<CR>

" Rustlang settings
map <Leader>r :!cargo run<CR>

" Terminal
map <Leader>term :let $VIM_DIR=expand('%:p:h')<CR>:split<CR><C-w>J:resize 5%<CR>:terminal<CR>icd $VIM_DIR; clear<CR>

" IDE mode
map <Leader>ide :let $VIM_DIR=expand('%:p:h')<CR>:only<CR>:Tagbar<CR>:18Lexplore<CR><C-w>w:10split<CR><C-w>J:resize 10<CR>:terminal<CR>icd $VIM_DIR; clear<CR><ESC><C-w>w<C-w>w

" Setting up my ShaDa settings
set shada='1000,f1,<500

" use register p (for preview) "py
map <Leader>lp :!xdg-open <C-r>p  2>/dev/null

" indentation settings
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = '¦'
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_enabled = 0
map <Leader>il :IndentLinesToggle<CR>
map <Leader>is :LeadingSpaceToggle<CR>

" prettier settings
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 120

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'false'

" ale settings
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


" My personal vim notes
"
" Check health with     :checkhealth
"
" Start nvim in diff mode:  `nvim -d <fileA> <fileB>`
" or from within nvim:
"       `:edit <fileA>`
"   	`:vertical diffsplit <fileB>`
"   	without `vertical`, a horizontal split will be created.
"   	Jumping to changes: `]c` and `[c`
"   	Removing changes:   `:diffupdate`
"	    Get changes:
"   	`:dp` diff put
"   	`:do` diff obtain
"
" "%p   : paste current filename
" :!cp % <new filname>      : copy current file to new file
"
"
" :help i_^n            : what is <C-n> in insert mode?
" :help n_^n            : what is <C-n> in normal mode?
" :help c_^n            : what is <C-n> in command mode?
" :helpgrep             : if you don't know what exactly you are looking for
"
"       Normal mode     : default mode for navigation and text manipulation
"       Insert mode     : inserting new text
"       Visual mode     : navigation and manipulation of text selections
"       Command mode    : run ex commands, eg. :set number, enter search, eg.
"                         /whoa after running the command vim goes back to
"                         normal mode
"       Insert normal mode : enter this mode in insert mode by pressing <C-o>
"                            like normal mode, but after executing one command
"                            your are again in insert mode
"
" Set up your ShaDa-File, see https://neovim.io/doc/user/usr_21.html
" Get back with '0 (for the last one) and '1 ... '9
" Use `:browse oldfiles` as alterntive
" Or `:mksession tada.vim` with `:source tada.vim`
"
" To edit binary files use `vim -b <file>`, to convert the file to a hex-dump use `:%!xxd`, convert
" back with `%!xxd -r`
"
" Operators     c(hange) d(elete) y(ank) ~ (toggle case) gu (change to lower) gU (change to upper) ! (execute command) < > = (indent, dedent, reformat)
" Text objects  aw (a word) iw (inner word) aW (a Word) iW  (inner Word) ap (a Paragraph) ip  (inner paragraph) ab (a bracket)
"               ib (inner bracket) at (a tag) it (inner tag)
" Motions       % with [count]  + f/F t/T h j k l ]m w/W b/B e/E
"
" Normal mode
"   Moving/Motions use [n] before motion, default to 1
"
"       j, k, h, l                      move cursor down, up, left, right
"       [n]+                            move down to first char [n] times
"       w, W                            move forward  to the start of a word (W only.whitespace.counts as word separator)
"       e, E                            move forward  to the end   of a word (E only.whitespace.counts as word separator)
"       ge                              move backward to the end   of a word
"       b, B                            move backward to the start of a word (B only.whitespace.counts as word separator)
"
"       0                               move to first column
"       ^                               move to the first non-blank character
"       g^
"       $                               move to the end of the line
"       g_                              move to the last non-blank character
"       gm                              move to the middle of the screen line,
"                                       like g0 plus half a screenwidth to the right
"
"       %                               go to the corresponding (, {, [
"       *                               go to the next occurrence
"       #                               go to the previous occurrence
"                                           of the word under the cursor
"       g*                              search forward for word, also as part
"       g#                              search backward for word, also as part
"
"       {                               go to the beginning of the paragraph
"       }                               go to the end of the paragraph
"
"       (, )                            sentences backward, forward
"       ge                              move backward to the end   of a word
"
"       ]]                              move by function
"       ]}                              move by scope
"       ])                              move by parent
"       ]/                              move by comment
"       ]c                              diff block
"
"       50%                             go to the line at the 50% of the file
"
"       H, M, L                         move              to the top, middle, low on the viewport
"       zt, zz, zb                      move current line to the top, middle, low on the viewport
"
"       gg, GG                          move to first, last line
"       0G, G, $G                       move to first, last line
"       [n]G                            move to line [n]
"       [n]|                            move to column [n]
"       :<number>                       move to line [n]
"
"       ''                              move to last position
"       '.                              move to last edit
"
"       f<char>                         move forward to             <char>
"           3f<char>                    move forward to the third   <char> on the line
"       t<char>                         move forward before (till)  <char>
"       F<char>                         move backward to            <char>
"       T<char>                         move backward before        <char>
"       ;                               find the next occurence
"       ,                               find the previous occurence
"
"       /<search>                       move forward to the next <search>
"       /word\>                         matches only end of the word
"       /\<word\>                       matches complete word
"       /\<word                         matches only start of the word
"
"       /word$                          search pattern: end of line
"       /^word                          search pattern: start of line
"       /w.rd                           search pattern: any single character
"                                       Note: use \<special char> for search which uses a search
"                                       pattern character
"       ?<search>                       move backward to the last <search>
"       :set ignorecase                 should the search case-sensitive?
"       :set noignorecase
"       :set nohlsearch                 no highlighting for the searchresults
"       :set hlsearch                   highlighting
"       :nohlsearch                     disable highlighting for the current results
"       //                              repeat last search
"       n                               repeat last search
"       N                               repeat last search in opposite direction
"       gn gN                           char-wise Visual-mode and select next/prev match
"                                       :h regex
"
"       ggn                             go to the top and then to the first occurrence
"
"       <C-u>                           move half page up
"       <C-d>                           move half page down
"       <C-b>                           move full page up
"       <C-f>                           move full page down
"
"       <C-a>                           increment number under the cursor
"
"       Jumplist                        :jumps
"       <C-o>                           jump back
"       <C-i>                           jump forward
"
"       Changelist                      :changes
"       [count]g;                       go to older position
"       [count]g,                       go to newer position
"
"       [{                              jump back to the start of the current code block
"       ]}                              jump back to the end of the current code block
"
"       gd                              jump from the use of a variable to its local declaration
"       gD                              go to global definition
"       gf                              follow file under cursor
"       gx                              follow url under cursor
"
"   Changing
"       .                               repeat last change
"       [n]x                            delete [n] char(s) under cursor
"       [n]X                            delete [n] char(s) left from the cursor
"       [n]r                            replace char
"       [n]s                            delete char and go to insert mode
"       S                               delete line and go to insert mode
"       J                               join lines
"       gU                              change selection to uppercase
"       gu                              change selection to lowercase
"       gUU                             uppercase current line
"       guu                             lowercase current line
"       ~                               toggle selection to upper-/lowercase
"
"       Running external programs and using filters
"
"           :[range]!{program}	filter text through {program}
"
"       !!  will populate the command-line with :.! followed by an external
"       program, that programs output will populated to the current line(s):
"                                       !!ls
"                                       !!cat %
"
"       :![cmd]                         :.,+4!nl -ba -w1 -s' '
"       :r ![cmd]
"
"       U                               undo all changes to the line of the latest change
"       [n]u                            undo
"       :undo [n]
"       [n]<C-r>                        redo
"       :redo [n]
"
"   To undo previous actions, type:            `u`{normal}  (lowercase u)
"   To undo all the changes on a line, type:   `U`{normal}  (capital U)
"   To undo the undo's, type:                  `<C-r>`{normal}
"
"       Undobranches
"       [n]g-
"       :earlier [n][smhdf]             Go to older text state [n] times
"                                       = s, m, h, d, f(ile save)
"                                       :earlier 1f   latest file save state
"
"       [n]g+
"       :later [n][smhdf]               Go to text state [n] times
"                                       = s, m, h, d, f(ile save)
"                                       :later 1f   latest file save state
"       Command language
"
"           A command is made up of
"               - a Verb (an operation) and
"               - a Noun (a section of text)
"
"               [n]<command>            repeat <command> n times
"               [n]<command><text object or motion>
"
"               The number is optional and can either appear before or after the command.
"               The command is an operation, e.g. change, delete, yank.
"               The text object or motion can be a word, sentence, paragraph or motion.
"
"               An editing command is a command plus a text object or motion, e.g. delete this word,
"               change the next sentence, copy this paragraph.
"
"           After pressing the command, vim waits for the identification of the text it
"           should operate on.
"
"               d     = delete
"               c     = change
"               y     = yank
"               p, P  = paste, before
"               v     = visually select
"               >, <  = indent, dedent
"               =     = reformat
"
"               Examples:
"                   `4==`   to reformat the current and the next four lines
"                   `=%`    to reformat a block of code
"                   `gg=G`  to reformat the complete file
"                   `magg=G'a
"
"           Repeating the command operates always on the current line:
"               dd, cc, yy/Y, pp, <<, >>, ==
"
"           Nouns
"               Motions (see above)
"                   j           = line down,
"                                       e.g. dj         (delete current till next line)
"                   t           = till, e.g. ct<char>   (change till <character>)
"                   w           = word, e.g. dw         (delete to the next word)
"                   e           = word, e.g. de         (delete to the end of the current word)
"                   /<search>   = up until the first search match,
"                                       e.g. c/<word>   (change till <word>)
"
"               Text objects
"                   iw          = inner word excluding the spaces,
"                                       e.g. ciw (change inner word)
"                   aw          = a word including the spaces,
"                                       e.g. daw (delete a word)
"                   ip          = inner paragraph excluding newlines,
"                                       e.g. vip (visually select inner paragraph)
"                   ap          = a paragraph including the newlines,
"                                       e.g. vap (visually select a paragraph)
"                   i)          = inner parenthesis also ]}>
"                                       e.g. ci) (change inner parenthesis)
"                   a)          = a parenthesis
"                                       e.g. da) (delete a parenthesis)
"                   ib          = inner parenthesised block
"                   ab          = a parenthesised block
"
"                   a]
"                   i]
"                   a}
"                   i}
"
"                   it          = inner tag
"                   at          = a tag including opening and closing tags
"                   a>          = a single tag with <>
"                   i>          = a single inner tag within <>
"
"                   i'          = inner single quote also `
"                   a'          = a quote including the quotes
"                   i"          = inner double quote
"                   a"          = a double quote including the quotes
"                   i`          = inner back quoted string
"                   a`          = a back quoted string
"                   is          = inner sentence    :help sentence
"                   as          = a sentence
"
"                   You don't need to be in " or tag:
"                       ci" changes the first ""
"                       cit changes the first tag
"                  :help text-objects
"
" Replace mode
"           R           replace
"           r{char}     overwrite just one character
"           gR          virtual replace mode, treats the tab-character as spaces
"           gr{char}    virtual replace for just one char
"
" Insert mode (i, I, a, A, o, O, s, S, C, R)
"   i = insert at cursor,               I = insert at column 0
"   a = insert behind cursor,           A = insert at last char
"   o = new line,                       O = new line above
"   s = delete char and insert,         S = delete line and insert
"   C = delete until end of line and insert
"   r = replace char                    R = enter Replace mode
"
"   Use I and A for visual block mode: infront or appended of the selected lines
"
"   Shortcuts
"       <C-h>                           delete char left from cursor
"       <C-w>                           delete word left from cursor
"       <C-u>                           delete line left from cursor
"       <C-i>                           tab
"
"       <C-r>=                          in insert-mode type calculation and hit return, eg. 5+5=<C-r>=5+5<R>
"       <C-g>                           show line and percentage
"       g<C-g>                          show even more information
"
"       Completion
"       <C-n>                           complete next
"       <C-p>                           complete previous
"
"       <C-x><C-l>                      whole lines
"       <C-x><C-n>                      keywords from current file
"       <C-x><C-k>                      keywords from 'dictionary' option
"       <C-x><C-t>                      keywords from 'thesaurus' option
"       <C-x><C-i>                      keywords from the current and includes files
"       <C-x><C-]>                      tags
"       <C-x><C-f>                      file names
"       <C-x><C-d>                      definitions and macros
"       <C-x><C-v>                      vim commands
"       <C-x><C-u>                      user defined as specified in 'completfunc'
"       <C-x><C-o>                      omni completion as specified in 'omnifunc'
"       <C-x>s                          spelling suggestions
"
" Visual mode (v)
"       o O                             jump to the start/end of a selection;
"                                       used to extend the selection.
"
" Visual-block mode (<C-v>)             :h blockwise-examples
" Visual-line mode (V)
"       d, x                            delete the visual block selection
"       c                               change
"       r                               replace
"       I                               insert text before the block
"       A                               insert text after the block
"
" Macros; apply them to multiple files with :args, :argdo
"       q<register>                     record your actions in <register>
"       @<register>                     replay macro in <register>
"       @@                              replay last executed macro
"
"       Edit a macro
"           "ap     - paste macro on a line
"                   - edit the macro
"           "ay$    - copy the macro in the register
"
"       Recursive macros: call the macro as the last step while recording
"
"       :6,16norm[al] @a    - execute macro a on line 6 to 16, incl.
"       :10,$norm @a        - execute macro a from line 10 to the end of the file.
"       :%norm @a           - execute macro a on all lines
"       :g/pattern/norm @a  - execute macro a on all lines matching pattern
"
"       Visually select lines, than type: :norm @a
"
"       100@a               - execute macro a 100 times, if it moves itself to the next line
"       .,+99norm @a        - execute macro a 100 times, if it not moves itself to the next line
"
"       SOP-Editing a macro:
"           qn          Record a macro to register n.
"           q           Stop recording the macro.
"           G			Go to the end of the file.
"           o<Esc>		Create an empty line.
"           "np			Put the text from the n register.  You now see the commands you typed as text in the file.
"           {edits}		Change the commands that were wrong.  This is just like editing text.
"           0			Go to the start of the line.
"           "ny$		Yank the corrected commands into the n register.
"           dd			Delete the scratch line.
"
"           use qN      to append recording to the register n
"
" Registers
"       show registers                  :reg
"
"       yank into register              "<register><yank>
"       paste from register             "<register>p
"
"       "aY                             yanks current line in register a
"       "AY                             appends current line in register a
"       "ap                             paste register a
"
"       set <content> on <register>    let @<register> = '<content>'
"
"       Named registers a-z            overwrite register
"                       A-Z            appends to register
"
"       Clipboard registers
"       "+y                             to copy text to the os clipboard
"       "+p                             to paste text from the os clipboard
"       "*y                             to copy text from the primary clipboard or use <C-S-v> ctrl+shift+v
"       "*p                             to paste from the primary clipboard

"       q<register>q                    empty <register> (start/stop recording)
"
"       :delete c                       delete current line and put it in register c
"       :put c                          put current register c at the cursor
"       :yank c                         yank current line to register c
"
"       Whenever you y(ank), d(elete), c(change) s(ubstitute) or cut x some text,
"       it is placed in the unnamed register.
"       Just use 'p' to paste the content of the unnamed register.
"
"       The dot command has its own register - quantify the dot, like 9. to
"       repeat the last . command nine times.
"
" Marks
"       :marks                          show all marks
"       m<a-z>
"       m<A-Z>                          marks accross different files
"
"       '<mark>                         jump back to the first non-blank
"       `<mark>                         jump back to exact position
"
"       Auto-marks
"       '0                              last edit, survives vim-sessions
"       ''                              position before the last jump
"       '.                              location of last change
"       '^                              last insert
"       '[                              start last change or yank
"       ']                              end last change or yank
"       '>                              start last change visual selection
"       '<                              end last change visual selection
"
" Folding :h folds; zf Fold creation, zo Open a fold, zc Close a fold
"       zf, zF
"
"       zfap                            fold around paragraph
"       zf5j                            fold next current and next five lines
"       zfa{                            fold in block of {}
"
"       zo                              open fold
"       zc                              close current fold under cursor
"       za                              toggle current fold under cursor
"       zd                              delete fold under cursor
"       zj                              move cursor to the next fold
"       zk                              move cursor to the previous fold
"       zR                              open all folds in the current buffer
"       zM                              close all folds in the current buffer
"       zE                              delete all folds in the current buffer
"
"       :fold
"
"       folding-modes: manual, indent, syntax, marker, expr, diff
"       create persistent foldes with: :mkview and :loadview
"
"       Configuration
"           :set foldmethod=<mode>
"           :set foldcolumn=2
"           :set foldlevelstart=1
"           :let php_folding=1
"           :let javaScript_fold=1
"
" Tags; create a tag file with `ctags -R .` in the project root
"   :set tags=./tags    default should work out of the box
"
"   :tag <function>     go to the function declaration
"   :tnext              go to the next function defition
"   :tfirst
"   :tlast
"   :tprev
"   :tselect            select the tag you like
"
"   :tags               show the lists of tags
"   :[num]tag           go to the first or num tag in the tagslist
"
"   use <tab> for the function-name
"
" Ranges
"       A range is either a single address or a pair of adresses seperated
"       by , (to is relative the currentline) or ; (to is relative to from)
"
"       You are on line 5: :1,+1y would yank lines 1 to 6
"                          :1;+1y would yank lines 1 to 2
"
"       :100    go to line 100
"       :d      delete current line
"       :.d     delete current line
"       :1y     yank first line
"       :$y     yank last line
"       :1,$y   yank all lines
"       :%y     yank all lines
"       :.,5y   yank current line to line 5
"       :,5y    yank current line to line 5
"       :-3,y   yank current line and previous three lines
"       :,+3y   yank current line and the next three lines
"       :1,+3y  first line to current line + 3
"       :690,'ay    from line 690 to the line marked with a
"       :/^foo/,$y   From the next line thats starts with foo to the end
"       :/^foo/+1,$y   From the line after the line that starts with foo to the end
"
"       the / can be stacked:
"       :/foo//bar//quux/y  would yank the first line containing quux, after the
"       first line containing bar, after the first line containing foo
"
"       In visual-mode result of marking:
"       :'<,'>y     yank the previously selected lines
"
" Subsitution :h :s_flags
"
"   :[range]s[ubstitute]/{pattern}/{string}/[flags]
"
"           Special chars:
"               \r, \t, \\
"               \1 insert first submatch
"               \[2-9] insert submatch 2 ... 9
"               \0 insert the entire matched pattern
"               &  insert the entire matched pattern
"               ~  Use {string} from the previous invocation of :s
"
" Command-line
"       :help                               to follow a link press <C+AltGr+9>
"       :nohl                               end highlighting
"       :@:                                 repeat last ex-mode command
"       :[n]                                go to line [n]
"
"       :global                             execute a command on all matching lines
"       :global /<search>/ print            will use print on all matching lines
"
"       Edit more files with :grep and :cn
"
"       Use external programs
"           Select current paragraph, let's count it's words:
"           :w !wc -w
"
"       :pwd
"       :e <file>                           use tab for auto-complete
"       :e %<Tab>                           % placeholder for the filepath of the current-buffer
"       :e %:h<Tab>                         fullpath of the current working directory
"
"       :set path+=src/**                   search this path for find
"       :find <filename>                    use <tab> for auto-complete
"
"       <C-r><C-w>                          copies the current word to the command-line
"
"   Buffers (in-memory representation), windows and tabs (viewports)
"       Buffers
"           :ls                             show buffers
"           :buffers                        print out all buffers
"           :[n]b                           switch to buffer [n]
"           :bnext :bn                      switch to next buffer
"           :bprevious :bp                  switch to previous buffer
"           :close                          close buffer
"           :ball                           open all buffers in a window
"           :sball                          open all buffers in splits
"           :bdelete :bd                    delete current buffer
"           :bdelete <n> <n> <n>            delete buffers
"           :bufdo  <command>               apply ex-command to all buffers
"           :sb                             split window and edit buffer
"           :sbn                            split window and go to the next buffer
"           :sbp                            split window and go to the previous buffer
"           :bf[irst]                       go to the first buffer
"           :sbf                            split window and go to the first buffer
"           :bl[ast]                        go to the last buffer
"           :sbl                            split window and go to the last buffer
"
"           :b <num>                        show buffer <num>
"           :b <name>                       show buffer with <name>
"
"           %           = visible buffer in the current window
"
"       Window
"           :new <filename>                 open a new window above the current window
"           :vnew <filename>                open a new window beside the current window
"           :split :sp <filename>           edit a file in new window above the current
"           <C-w>+s
"           <C-w>+v
"           <C-w>+c                         close current buffer (split)
"           :vsplit :vs <filename>          edit a file in new window beside the current
"           :sf <filename>                  split and find file <filename>
"
"           :edit :e <file>                 open and edit a file
"           :find :fin                      find
"           :e!                             read file back, revert changes made
"           :w                              save file
"           :wa                             save all files
"           :w! <file>                      overwrite a file
"           :saveas <file>                  save to file with path
"           :x, ZZ, :wq                     save and quit
"           :q!, qa!                        quit without saving
"
"           :lcd {path}                     set working directory locally for current window
"           :lcd %:p:h                      set working directory to the current files directory
"           :windo lcd {path}               set working dir for all splits (windows)
"
"       Navigating and Moving
"           <C-w>w                          navigate to the next window
"           <C-w>h, j, k, l                 navigate to the window in the
"                                           given direction
"           <C-w>H, J, K, L                 move the current window to the
"                                           given direction
"
"	        <C-w>b                          move to the BOTTOM window
"	        <C-w>t                          move to the TOP window
"
"           <C-w>T                          move the current window to a tab
"
"       Layout
"           [count]<C-w>-                   decrease height
"           [count]<C-w>+                   increase height
"           [count]<C-w><                   decrease width
"           [count]<C-w>>                   increase width
"           <C-w>_ <C-w>|                   max the split
"           <C-w>=                          equalize the width and height of all windows
"
"           <C-w>r                          rotate from left to right
"           <C-w>R                          rotate from right to left
"
"           :on(ly)                         show only current window
"
"       Tab (are window containers)
"           :tabnew :tabn                   new tab
"           :tabedit :tabe                  edit tab
"           :tabe split                     create tab with the current file
"           :tabc                           close tab
"           :tabo                           only this tab
"           :tabmove <n>                    move current tab to pos <n>,
"                                           without n, move it to the end
"           [num]gt, gT                     go to next, previous tab, or the the num-th tab
"           :tabfirst                       navigate to first tab
"           :tablast                        navigate to last tab
"
"   Arguments - effective multiple file editing
"           vim *.txt
"           :arga <name>    add <name> to the argument list
"           :argdo      run ex-command on each item in the argument list
"           :args       show the current arguments
"           :args <file> <file> ...     populate the arguments
"           :args <glob like * or ** which also is recursive>
"           :next
"           :prev
"           :args *.*
"           :args **/*.js
"           :args **/*.*
"           :args **/*.js **/*.css
"           :args `cat .content`        use the content of .content
"           :args /path/to/files/*/*                    replaces argslist with new one
"           :n      go to the next file based on arg list
"
"           :bufdo      for buffer list
"           :windo      for window list - effects only visible windows
"           :norm[al]   for running commands in normal mode
"           :exe[cute]  for executing commands
"
"           :bufdo exe ":normal Gp" | update
"           :bufdo exe ":normal! @a" | w                execute macro over all buffers
"
"   Command-line mode
"       :[range]delete [x]      Delete specified lines [into register x]
"       :[range]yank [x]        Yank specified lines [into register x]
"       :[line]put [x]          Put the text from register x after the spec. line
"       :[range]copy {address}  Copy the specified lines to below the line
"                               specified by {address}
"       :[range]move {address}  Move the specified lines to below the line spec.
"                               by {address}
"       :[range]join            Join the specified lines
"       :[range]normal {commands}   Execute Normal mode {commands} on each
"                                   specified line
"       :[range]substitute/{pattern}/{string}/[flags]
"                                   Replace occurrences of {pattern} with {string}
"                                   on each specified line
"       :[range]global/{pattern}/[cmd]
"                                   Execute the ex command [cmd] on all specified
"                                   lines where the {pattern} matches
"
"       :normal <command>    combines normal commands with range
"
"   File-Explorer
"       :edit .
"       :e.                                 open for the current working directory
"       :Explore                            open for the current buffer
"
" Session
"       :mksession <session>                create <session>
"       :mksession! <session>               overwrite <session>
"       :source <session>                   load <session>
"       vim -S <session>
"
" Configuration                             :e $MYVIMRC
"                                           :browse set
"   Autocommands hook into event system     :h autocomd-events, :au show current autocommands
"
" Examples
"               2dd                         delete 2 lines
"               3p                          paste text 3 times
"               db                          delete to the begining of the previous word
"               100idesu<Esc>               write 100 times desu
"               .                           write again 100 times desu
"               3.                          write 3 times desu
"
"               yw                          yank word
"
"               <start><command><end>
"               0y$                         yank from start to end of the line
"               ye                          yank from here to the end of the word
"               y2/foo                      yank up to the second occurence of foo
"
"               vi"                         select within "
"               va"                         select with "
"               vi)                         select within )
"               va)                         select with )
"
"               0<C-v>                      move to first column, start block selection
"               I--<Esc>                    write -- to comment out each line
"
"               i1<Esc>qaYp<C-a>q           start with a number, start recording in register a
"                                           yank and paste the line
"                                           increment the number
"                                           stop recording
"               @a                          write 2 under 1
"               @@                          write 3 under 2
"               100@                        write numbers till 103
"
"               dl                          delete single character
"               d2l                         delete two characters
"
"               yl                          copy char
"               yy                          copy line
"               yw                          copy word
"               cw                          delete word and go to insert mode
"               d$                          delete to end of the line
"               dG                          delete to end of the file
"               dgg                         delete to start of the file
"               df.                         delete to the '.'
"
"               <a href="https://vim.org">Vim is cool</a>
"               vit                         selects the tag content
"
"               gU2w                        makes the rest of the current and next one uppercase
"
"               ci(                         change everything between parantheses
"               d2a(                        will remove the 2 inner pairs of parantheses and everything in
"                                           between
"
"               qqiabc<cr><esc>10@q         add 10 times abc
"               oabc<esc>10.                add 10 times abc
"
"               <C-v>3j$Atext for the line ending of this block for three lines<Esc>
"
"               >G                          increases the indentation from the current line
"
"               <C-v>jj$A;<Esc>             switch to visual-block mode,
"                                           select the next two rows and to the end
"                                           append a semicolon to each line
"
"               <C-v>jjec<Esc>              switch to visual-block mode,
"                                           select three lines till the end of the
"                                           current word
"                                           change selected word
"                                           back to normal mode, all the words selected
"                                           are changed
"
"               :%s/foo/bar/g
"               :%s/foo/bar/gc              <C-e> to scroll up, <C-y> to scroll down
"
"               :%s/foo//gn                 Count the matches
"
"               visp                        Visually-select sentence and replace
"
"               :!mkdir -p %:h              create the non-existing directories
"
"               :2,$!sort -t',' -k2         sort the selection by the second column
"
"               :%normal A;                 add ; to all lines
"               :%normal i//                comment out an entire file
"                                           use it with ranges or visual-selections
"
"               Vj>.                        select current, next line
"                                           indent the lines one time and a second
"                                           time by using the dot command
"
"               <C-v>3jx...gvr|yypVr-       switch to visual-block mode,
"                                           select 4 rows
"                                           delete one char four times
"                                           reselect selections
"                                           insert | at each row
"                                           copy paste current row
"                                           switch to visual-line mode,
"                                           replace everything with -
"
"               :r                          read a file into the current buffer
"               :0r <filename>              read the file into the current buffer just
"                                           before the first line
"               :r !ls                      insert directory listing
"               :r !sed -n 2,8p <filename>  insert lines 2 to 8 from filename below the
"                                           cursor
"
"   Misc
"       Insert unusual characters by character code in insert mode
"           <C-v>{code}
"           <C-v>u{code}
"               <C-v>u00bf      = ¿
"
"           ga                  show character code under cursor
"
"       Insert unusual characters by digraph
"           <C-k>{c1}{c2} :help digraph-table
"
"       <C-o-o>                 open the last file edited
"
"       [Num]<C-a>   increment number under cursor
"       [Num]<C-x>   decrement number under cursor
"
"   Command-Line-Window and Search-Window - they show a history of...
"       :help command-line-window
"       p:
"   Search window:
"       q/
"       q?
"
"   Starting vim:
"       vim <file>.tar.gz           see filelist in archive and select one to be edited
"       +num            : place the cursor on line num
"       +/{pattern}     : place the cursor on first pattern
"       +cmd            : cmd will be executed after reading the file
"       -x              : use encryption
"       vim -u NONE     : start vim without configuration
"
"          search history
"          /            navigate search history with cursor up/down
"          /<enter>     repeats the last search
"          <num>/<pattern>  jumps to the <numt>th occurrence
"          <num>*           search for the <num>th occurrence of the word
"                           under the cursor
"          / hit <C-r><C-w> this copies the current word to the search
"
"       file manager (netrw) in vim, cycle through view-types with i and sort
"       with s
"           :Ex         open current directory and explore
"           :Ex <dir>   open the specified directory
"           :Sex        open current directory in horizontal split
"           :Vex        open current directory in vertical split
"           :Tex        open current directory in a new tab
"           :Lexplore   vertical split on the left side
"
"           :40vs +ex   just try it ;-)
"               open current directory in vertical split with a width of 40 cols
"
"        <enter> opens the file under the cursor
"        d       deletes the file under the cursor,
"                visually selected you can delete multiple files
"        r       renames the file under the cursor
"        x       executes the file under the cursor
"        %       creates a new file under the cursor
"
"      editing files via scp, ftp etc.
"       vim scp://user@host[:port]//path/to/file
"
"
"       tips
"       gv - select the last visual selection - useful when you mess up a search/replace ...
"
"      personalizing vim
"          :echo $HOME      - show home directory
"
"          :set number|nonumber
"          or disable boolean with
"          :set number!
"          :colorscheme <name>
"          :set cursorline
"          :set cursorcolumn
"          :highlight cursorline guibg=lightblue ctermbg=lightgrey
"          :set spell
"          :set nospell
"          :set spell? - current setting
"
"   Substitution - search and replace
"       Default range is the current line.
"       :[range] s[substitute]/pattern/string/[flags] [count]
"
"       :s/bad/good/g           changes all bad to good in the current line
"       :6,11s/bad/good/g       changes all bad to good on line 6 - 11, including
"       :%s/bad/good/g          changes all bad to good in the entire file
"       :28s/bad/good/g         changes all bad to good on line 28
"       :$s/bad/good/g          changes all bad to good on the last line
"       :11,$s/bad/good/g       changes all bad to good from line 11, incl., to the end of he file
"       :.,$s/bad/good/g        ... current line to the end of the file
"       :.+1,$s/bad/good/g      ... one line after the current line to the end of the file
"       :.,+4s/bad/good/g       ... current line and next four lines, incl.
"       :?a?,/b/s/bad/good/g    ... between paterns a and b, incl.
"
"       Replacement inside visual selection is possible, use 'v'
"       Replace only whole words: :s/\<pattern\>/string/g
"       Replace either string1 or string2 with a new word: :s/\(pattern1|pattern2\)/string/g
"       if you need a normal | mask it: \|
"
"   Search through multiple files: :vimgrep pattern *.suffix
"       :cn jump to the next match
"       :cN jump to the previous match
"       :clist view all files that contain matched string
"       :cc number jump to the specified match number
"
"       Search recursively: :vimgrep error **/*.log = search all *.log
"
"   Global command
"
"       :[range]g/pattern/cmd
"       :g/error/d              delete all lines which contain string 'error'
"       :g!/important/d         delete all lines which not contain 'important'
"       :g/^\s*$/d              delete all blank lines; \s* zero or more space chars
"
"       deleted content is copied to a register, in a large file with many deletions
"       this can be a performance hit, so use the blackhole register '_'
"
"       :g/pattern/d_           no register operation is performed
"
"       Execute macro with the global command:
"       :g/vim/normal @a
"
"       Copy and move lines: :<start>,<till>t<dest>
"       :3,9t20     - copy line 3 to 9 to line 20
"       :3,9m20     - move line 3 to 9 to line 20
"
"       :m0         - move current line to the top
"
"       For every line containig "good" substitute all "bad" with "ugly":
"       :g/good/s/bad/ugly/g
"
"       Reverse all the lines: :g/^/m0
"
"   vim -O file1 file2 file3 opens three windows for three files
"   The power of visual modes
"
"       gv          in normal mode re-selects the last visual-selection
"       [count]v    select chars in a file
"       [count]V    select lines in a file
"
"       use :normal . to use the dot-command over visually selected content
"
"   Productivity tips
"       :20co[py].                  paste line 20 to current position
"       :-1co.                      paste line above to current position
"       :20,25co.                   paste lines 20-25 ...
"       :t is an alias to :co       - it just works the same
"
"       :mo[ve]                     see co[py]
"       :.mo+1                      move current line to the next line
"
"       :5,10d                      delete lines
"
"       :put =range(1,5)            create 1 to 5
"       :for i in range(1,10) | put ='192.168.0.'.i | endfor
"
"       <C-v>g<C-a>             on a number, all selected columns will be inc'ed
"       `i<p id="p1">blah blah</p><ESC>yy9pf1<C-v>8jg<C-a>`
"
"       8i<Enter><Esc>          insert eight lines
"       20i-<Esc>               insert 20 - chars
"
"       Execute multiple commands at once <command> | <command> ... | ...
"
" Bookmarks
"   http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/
"   http://learnvimscriptthehardway.stevelosh.com/
"   http://benmccormick.org/learning-vim-in-2014/
"   https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
"   https://www.moolenaar.net/habits.html
"   https://github.com/mhinz/vim-galore
"   https://begriffs.com/posts/2019-07-19-history-use-vim.html
"
" set foldclose=all " Close folds if you leave them in any way
"      set foldcolumn=1 " Show the foldcolumn
"      set foldenable " Turn on folding
"      set foldlevel=0 " Autofold everything by default
"      set foldmethod=indent " Fold on the syntax
"      set foldnestmax=1 " I only like to fold outer functions
"      set foldopen=all " Open folds if you touch them in any way
"
" Edit visual selections with o and O 
"
" Undo in Insertmode with <C>-u
"
" vim -O file1.txt file2.txt open both files win different splits vertically
"
" :windo difft
" show diff for the splits

" the difference between 6j and 6+ is, the later goes to the first non space character
" and 6$ goes to the last character in the sixth line

" close the floating windows, eg opened by CoC, with <C-w>o
