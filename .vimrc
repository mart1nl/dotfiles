let mapleader = "\<Space>"
inoremap jj <ESC>
nnoremap <leader><leader> V
nnoremap <leader>f <c-f>
nnoremap <leader>b <c-b>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Search and replace
nnoremap <Leader>s :%s//g<Left><Left>

nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>

inoremap <c-h> <Left>
inoremap <c-j> <Up>
inoremap <c-k> <Down>
inoremap <c-l> <Right>

vnoremap ' <esc>`>a'<esc>`<i'<esc>f'
vnoremap " <esc>`>a"<esc>`<i"<esc>f"
vnoremap ) <esc>`>a)<esc>`<i(<esc>f)
vnoremap ] <esc>`>a]<esc>`<i[<esc>f]

" Some test abreviations
iabbrev ssig --<CR>Martin Loginov<CR>martin.loginov@gmail.com<CR>skype:mart1nl<CR>
iabbrev @@ martin.loginov@gmail.com

" Some commenting for different filetypes
autocmd FileType clojure inoremap <buffer> () ()<Left>
autocmd FileType clojure inoremap <buffer> [ []<Left>
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
autocmd FileType javascript vnoremap <buffer> <leader>c I//<esc>
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
autocmd FileType python vnoremap <buffer> <leader>c I#<esc>

augroup Go
    autocmd!
    autocmd FileType go set autowrite
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
    autocmd FileType go nnoremap <buffer> <leader>b :GoBuild<CR>
    autocmd FileType go nnoremap <buffer> <leader>r :GoRun<CR>
    autocmd FileType go noremap <buffer> <C-n> :cnext<CR>
    autocmd FileType go noremap <buffer> <leader>c :cclose<CR>

augroup END

augroup Elm
  autocmd!
  autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd BufWrite *.elm setlocal filetype=elm
augroup END

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" backups and stuff
set nobackup
set writebackup

set undodir=~/.vim/undo
set undofile

set hidden                      " Allow switching buffer without saving 

"user interface
set history=1000                " remember command mode history
set laststatus=2                " always show status line
set lazyredraw                  " don't update screen inside macros, etc
set matchtime=2                 " ms to show the matching paren for showmatch
set number                      " line numbers
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching brackets while typing
"set relativenumber              " line numbers spread out from 0
"set cursorline                  " highlight current line
set display=lastline,uhex       " show last line even if too long; use <xx>

" regexes
set incsearch                   " do incremental searching
set ignorecase                  " useful more often than not
set smartcase                   " case-sens when capital letters

" Indents
set autoindent                  " keep indenting on <CR>
set shiftwidth=4                " one tab = four spaces (autoindent)
set softtabstop=4               " one tab = four spaces (tab key)
set expandtab                   " never use hard tabs
set shiftround                  " only indent to multiples of shiftwidth
set smarttab                    " DTRT when shiftwidth/softtabstop diverge

filetype indent on              "allows auto-indenting depending on file type

" GUI
" set ttymouse=xterm2             " force mouse support for screen
" set mouse=a                     " terminal mouse when possible
set guifont=Source\ Code\ Pro\ 9    
                                " nice fixedwidth font

set number                      " set line numbers
syntax enable                   " enamble syntax highligting
set background=dark

" tab completion
set wildmenu                    " show a menu of completions like zsh
set wildmode=full               " complete longest common prefix first
set wildignore+=.*.sw*,__pycache__,*.pyc
                                " ignore junk files
set complete-=i                 " don't try to tab-complete #included files
"set completeopt-=preview        " preview window is super annoying

"" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F3>
set clipboard=unnamed

" Moving blocks of code and keep selection
vnoremap < <gv
vnoremap > >gv

set background=dark

set rtp+=~/.vim
call plug#begin('~/.vim/plugged')

Plug 'ivanov/vim-ipython'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'bling/vim-bufferline'
Plug 'lambdatoast/elm.vim'
Plug 'hashivim/vim-terraform'

call plug#end()

filetype plugin indent on

" Plugin settings

" NERDTree
map <F2> :Lexplore<CR>

syntax enable                   " enamble syntax highligting
set background=dark
highlight NonText ctermbg=none 
highlight Normal guibg=NONE ctermbg=NONE
