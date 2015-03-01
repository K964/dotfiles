"                      _                    
"               _   __(_)___ ___  __________
"              | | / / / __ `__ \/ ___/ ___/
"              | |/ / / / / / / / /  / /__  
"              |___/_/_/ /_/ /_/_/   \___/  
"               ============================
"                           K-9


"
" TODO:
"  - Find a way close matching (, [, {
"
"
" Tips:
" *) Add or remove comments at begining of line  when in visual-block mode
"    -press C-v to enter visual-block mode
"    -select the lines to be commented
"    -press C-c to add the comment or C-s to delete the comment characters
"

" Required plugins
"     bufexplorer
"     emmet-vim
"     matchit
"     neocomplete.vim
"     nerdtree
"     snipmate.vim
"     tagbar
"     tags
"     tlib_vim
"     vim-addon-mw-utils
"     vim-airline
"     vim-colors-solarized
"     vim-go
"     vim-instant-markdown
"     vim-surround


" Set <leader>
let mapleader = ","


" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"   BUNDLES STUFF
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" pathogen
execute pathogen#infect()

" Gather help file when vim starts
" :helptags ~/.vim/bundle/

" NerdTree
nmap <F4> :NERDTreeToggle<CR>

" Powerline
"set rtp+=/home/peirik/.local/lib/python3.4/site-packages/powerline/bindings/vim

" vim-arline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" jedi-vim (requires python2-jedi on arch)
" let g:jedi#documentation_command = "<leader> k"
" let g:jedi#user_tabs_not_buffers = 0
" let g:jedi#user_splits_not_buffers = "right"
" let g:jedi#popu_on_dot = 0

" BufferExplorer
noremap <F9> :BufExplorer<CR>
noremap <C-F9> :BufExplorerHorizontalSplit<CR>

" vim-go
let g:go_doc_keywordprg_enabled = 0

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" snipmate
"   Snippet files are located in ~/.vim/bundle/snipmate.vim/snippets/
"   use tabs to activate a snippet

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"   GENERAL
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Sets how many lines of history VIM has to remember
set history=700

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

" Turn on Wildmenu
set wildmenu

" Enable line numbers
set number

" When to start select mode instead of Visual mode, when a selection is started.
set selectmode=mouse,key

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
"set cursorline

" Always show the status line
set laststatus=2

" Continue comment on new line
set formatoptions=cro

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \%=Line:\ %l,(%c)\ \ %{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ \ %P

" Delete trailing white space on save, useful for Python (see function below)
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.py :call StripWhitespace()
autocmd BufWrite *.coffee :call StripWhitespace()

" Folding
" ------------------------
" good for python maybe not for others...
"set foldmethod=indent
set foldnestmax=2

" Dirs
" ------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swap
set undodir=~/.vim/undo

" Search
" ------------------------
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

" Terminal has 256 colors (better themes colors :)
set t_Co=256

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

" Indentation
" ---------------------
"Smart indent
set si

"Auto indent
set ai

" set smartindent
filetype plugin indent on

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Theme
" ---------------------
" Activate syntax highlighting
syntax on

" Color theme
set background=dark
colorscheme solarized "jellybeans blackboard wombat256 molokai

" Highlight column 100 and beyong
let &colorcolumn=join(range(101,999),",")
highlight ColorColumn ctermbg=232 guibg=#242423

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
    "set guifont=Inconsolata\ Medium\ 11
endif


" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"   BINDINGS
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Exit insert mode
inoremap kj <Esc>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Quickly close a buffer
nmap <leader>q :confirm quit<CR>

" Quickly save current buffer
nmap <leader>w :w<CR>
  
" Remap VIM 0 to first non-blank character
map 0 ^

" Remove whitespace at end of line (see function below)
nnoremap <leader>ws :call StripWhitespace ()<CR>

" Create a empty line abore cursor
nmap <C-o> <S-o> <Esc>

" Paste mode with F5
set pastetoggle=<F5>

" Highlight end of line
nnoremap <silent> <leader>c :set nolist!<CR>

" Moving around
" ---------------------
" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move between tabs
map <C-n> :tabnext <CR>
map <C-p> :tabprev <CR>

" Move between buffers
map <S-k> :bn <CR>
map <S-j> :bp <CR>

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

" Folding
" ---------------------
" Open a fold with space
nmap <space> zR


" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" SYNTAX
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript
" Less
au BufRead,BufNewFile *.less set filetype=less syntax=css
 

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" 	FUNCTIONS
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
" Delete trailing white space on save, useful for Python
"func! DeleteTrailingWS()
"    exe "normal mz"
"    %s/\s\+$//ge
"    exe "normal `z"
"endfunc

" Strip trailing whitespace (\ss)
function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

  
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" QUICKFIX
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Fixs a bug where the window when splited shrinks by moving it or altTabing
" Removed e and L from the normal options
" Use :set guioptions? to check the set values
:set guioptions=egmrtT
