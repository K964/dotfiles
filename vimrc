"                      _                    
"               _   __(_)___ ___  __________
"              | | / / / __ `__ \/ ___/ ___/
"              | |/ / / / / / / / /  / /__  
"              |___/_/_/ /_/ /_/_/   \___/  
"               ============================
"                           K9


"
" TODO:
"

" ==============================================================================
"
"                               Plugins (using Vbundle) 
"
" ==============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Mandatory
Plugin 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'xolox/vim-misc'               " Dependency for session
Plugin 'xolox/vim-session'            " Session management

" Golang
Plugin 'fatih/vim-go', {'for': 'go'}  " THE go plugin
Plugin 'garyburd/go-explorer'         " For GoDoc
Plugin 'SirVer/ultisnips'             " For awesome go snippets
Plugin 'honza/vim-snippets'           " Snippets are separated from the engine. Add this if you want them:

" Important
Plugin 'tpope/vim-fugitive'           " Git integration
Plugin 'tomtom/tcomment_vim'          " Commenting made easy
Plugin 'scrooloose/nerdtree'          " File tree
Plugin 'Raimondi/delimitMate'         " Auto-close brackets
"Plugin 'rking/ag.vim'                 " For silver surfing
Plugin 'majutsushi/tagbar'            " Tagbar
Plugin 'ap/vim-buftabline'            " Buffer bar
Plugin 'mattn/emmet-vim'              " Easy write HTML and CSS

" Nice to have
Plugin 'itchyny/lightline.vim'        " Statusline
"Plugin 'flazz/vim-colorschemes', { 'do': 'ln -s ~/.vim-go-runtime/plugged/vim-colorschemes/colors ~/.vim/colors' }
"Plugin 'mhinz/vim-sayonara'           " Kill buffer without closing window
Plugin 'altercation/vim-colors-solarized' " Solalired color theme

call vundle#end()            " required
filetype plugin indent on    " required
 
 

" =======================================
" Plugin configuration
" =======================================

" vim-go
"let g:go_doc_keywordprg_enabled = 0
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_autosave = 0 " Disable auto exec of gofmt because it folds everything on each save.

"
" Vim-Go
"
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_fmt_autosave = 0

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_doc_keywordprg_enabled = 0 "Disables the fucking S-k bindings that launches godoc.

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc)
au FileType go nmap <Leader>f <Plug>(go-def)
 

"
" YouCompleteMe
"
let g:ycm_autoclose_preview_window_after_completion = 1
 

"
" UltiSnips
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"
" DelimitMate
"
let g:delimitMate_expand_cr = 1     
let g:delimitMate_expand_space = 1      
let g:delimitMate_smart_quotes = 1      
let g:delimitMate_expand_inside_quotes = 0

"
" Tagbar
"
"nmap <Leader>m :TagbarToggle<CR>
nmap <F6> :TagbarToggle<CR>
let g:tagbar_width = 34
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
            \ 't' : 'ctype',
            \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
            \ 'ctype' : 't',
            \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
            \ }

"
" Vim-Session
"
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'


"
" Emmet (ZenCoding)
"
let g:user_emmet_leader_key = '<c-f>'

"
" vim instant markdow
"
let g:instant_markdown_slow = 1

"
" lightline
"
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction




" ==============================================================================
"
" 									GENERAL
" 									
" ==============================================================================

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on
  
" Set to auto read when a file is changed from the outside
set autoread

" Do not ask to save when moving away to a another buffer.
set hidden

" No annoying sound on errors
" set visualbell to empty string
set noerrorbells
set visualbell
set t_vb=
set tm=500

" Set UTF-8 as standard encoding
set encoding=utf-8

" User Unix as the standard file type
set ffs=unix,dos,mac

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Turn on Wildmenu
set wildmenu

" Enable line numbers
set number

" When to start select mode instead of Visual mode, when a selection is started.
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't wrap line
"set nowrap

 " Don't show the intro message when starting vim.
set shortmess=atI

" Split new window below
set splitbelow

" Split new window right
set splitright

" set current dir to currently open file
set autochdir

" Show the filename in the window title
set title
set cursorline

" Always show the status line
set laststatus=2

" Continue comment on new line
set formatoptions=cro

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \%=Line:\ %l,(%c)\ \ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ \ %P

" Delete trailing white space on save, useful for Python (see function below)
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.py :call StripWhitespace()
autocmd BufWrite *.coffee :call StripWhitespace()

" ++++++++++++++++++++++++++++
" Folding
" ++++++++++++++++++++++++++++
" good for python maybe not for others...
"set foldmethod=indent
"set foldnestmax=2
autocmd BufRead *.xml,*.html,*.tpl,*.go setlocal foldmethod=syntax
"autocmd BufRead *.xml,*.html,*.go normal zM
 
" ++++++++++++++++++++++++++++
" Dirs
" ++++++++++++++++++++++++++++
set backupdir=~/.vim/backups
set directory=~/.vim/swap
set undodir=~/.vim/undo

" ++++++++++++++++++++++++++++
" Search
" ++++++++++++++++++++++++++++
" Highlight search results
set hlsearch

" Ignore case when searching
set ignorecase

" When searching try to be smart
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
 
" How many tenths of a second to blink when matching brackets
set mat=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Show leader key when pressed
set showcmd

" Set the time before <leader> timesout
set timeoutlen=1300

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Show current position
set ruler

" Height of the command line
set cmdheight=2

" Add a bit extra margin to the left
set foldcolumn=1

" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

"Wrap lines
set wrap
 
" Activate syntax highlighting
syntax on

" ++++++++++++++++++++++++++++
" Indentation
" ++++++++++++++++++++++++++++
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" " ++++++++++++++++++++++++++++
" SYNTAX
" " ++++++++++++++++++++++++++++
" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript
" Less
"au BufRead,BufNewFile *.less set filetype=less syntax=css
" TPL
autocmd BufRead,BufNewFile *.tpl setlocal filetype=html syntax=html foldmethod=syntax
 

" " ++++++++++++++++++++++++++++
" FUNCTIONS
" " ++++++++++++++++++++++++++++
  
" Delete trailing white space on save, useful for Python
"func! DeleteTrailingWS()
"    exe "normal mz"
"    %s/\s\+$//ge
"    exe "normal `z"
"endfunc

" Strip trailing whitespace (<leader>ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Compile less
function CompileLess ()
    let cmd = "!lessc main.less ../styles.css"
    execute cmd
endfunction
  
" " ++++++++++++++++++++++++++++
" QUICKFIX
" " ++++++++++++++++++++++++++++
" Fixs a bug where the window when splited shrinks by moving it or altTabing
" Removed e and L from the normal options
" Use :set guioptions? to check the set values
:set guioptions=egmrtT




" ==============================================================================
"
" 									THEME
"
" ==============================================================================

" Color theme
set background=dark

try
    colorscheme solarized "jellybeans blackboard wombat256 molokai
catch
endtry

" Highlight column 100 and beyong
let &colorcolumn=join(range(101,999),",")
highlight ColorColumn ctermbg=232 guibg=#242423


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
    set guifont=Inconsolata\ for\ Powerline\ 10
    "set guifont=Inconsolata\ Medium\ 11
    " Terminal has 256 colors (better themes colors :)
    set t_Co=256
endif



" ==============================================================================
"
" 									BINDINGS
"
" ==============================================================================

" Set <leader>
let mapleader = ","
let g:mapleader = ","

" Free up bindings
map <c-f> <Nop>

" Exit insert mode
inoremap kj <Esc>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null

" Quickly close a buffer
nmap <leader>q :confirm quit<CR>

" Quickly save current buffer
nmap <leader>w :w<CR>
  
" Remap VIM 0 to first non-blank character
map 0 ^
 
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Remove whitespace at end of line (see function below)
nnoremap <leader>ws :call StripWhitespace ()<CR>

" Create a empty line abore cursor
nmap <C-o> <S-o> <Esc>

" Paste mode with F5
set pastetoggle=<F5>

" Highlight end of line
nnoremap <silent> <leader>c :set nolist!<CR>
  
" Call my less function (see below)
nnoremap <leader>l :call CompileLess ()<CR>

" ++++++++++++++++++++++++++++
" Moving around
" ++++++++++++++++++++++++++++
" Scroll up and down by 5 lines without moving the cursor
noremap <C-y> 5<C-y>
noremap <C-e> 5<C-e>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move between tabs
"map <C-n> :tabnext <CR>
"map <C-p> :tabprev <CR>

" Move between buffers
nnoremap <S-k> :bn <CR>
nnoremap <S-j> :bp <CR>

if has("gui_running")
    " Alt+leftarrow will go one window left, etc. GUI only!
    " Alt+leftarrow will go one window left, etc
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
    nmap <silent> <A-Up> :wincmd k<CR>
    nmap <silent> <A-Down> :wincmd j<CR>
    nmap <silent> <A-Left> :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
endif

" ++++++++++++++++++++++++++++
" Visual mode related
" ++++++++++++++++++++++++++++
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Treat long lines as break lines (useful when moving around in them)
" TODO test this
"map j gj
"map k gk
 
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
  
" NerdTree
nmap <F4> :NERDTreeToggle<CR>


" ++++++++++++++++++++++++++++
" Folding
" ++++++++++++++++++++++++++++
" Open a fold with space
nmap <space> zA
nmap <S-space> za


