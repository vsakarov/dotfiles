set nocompatible
let mapleader=" "

try
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
catch
  " who needs plugins anyway?
endtry

" gem install vim-update-bundles
" mkdir -p ~/.vim/undofiles
" mkdir -p ~/.vim/backup
" mkdir -p ~/.vim/swap
" Bundle: tpope/vim-pathogen

" Bundle: https://github.com/Lokaltog/vim-easymotion.git
" Bundle: https://github.com/Shougo/neomru.vim
" Bundle: https://github.com/Shougo/unite-outline
" Bundle: https://github.com/Shougo/unite.vim
" Bundle: https://github.com/altercation/vim-colors-solarized
" Bundle: https://github.com/chrisbra/NrrwRgn
" Bundle: https://github.com/ervandew/supertab
" Bundle: https://github.com/garbas/vim-snipmate
" Bundle: https://github.com/honza/vim-snippets
" Bundle: https://github.com/jakar/vim-AnsiEsc
" Bundle: https://github.com/kien/ctrlp.vim.git
" Bundle: https://github.com/mattn/emmet-vim
" Bundle: https://github.com/mileszs/ack.vim.git
" Bundle: https://github.com/nathanaelkane/vim-indent-guides.git
" Bundle: https://github.com/rking/ag.vim
" Bundle: https://github.com/scrooloose/nerdcommenter
" Bundle: https://github.com/scrooloose/nerdtree
" Bundle: https://github.com/scrooloose/syntastic.git
" Bundle: https://github.com/sjl/gundo.vim
" Bundle: https://github.com/tommcdo/vim-exchange
" Bundle: https://github.com/tomtom/tlib_vim.git
" Bundle: https://github.com/tpope/vim-abolish
" Bundle: https://github.com/tpope/vim-dispatch.git
" Bundle: https://github.com/tpope/vim-endwise
" Bundle: https://github.com/tpope/vim-fugitive
" Bundle: https://github.com/tpope/vim-git
" Bundle: https://github.com/tpope/vim-repeat
" Bundle: https://github.com/tpope/vim-surround
" Bundle: https://github.com/tpope/vim-unimpaired.git
" Bundle: https://github.com/vexxor/zenburn.vim.git
" Bundle: https://github.com/vim-scripts/Align
" Bundle: https://github.com/vim-scripts/a.vim.git
" Bundle: https://github.com/vim-scripts/matchit.zip.git
" Bundle: https://github.com/vim-scripts/taglist.vim.git

" NO PLUGIN SETUP
" ===============

set hidden
set autoread
set autowrite
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
nmap <leader>bd :bdelete!<CR>
nnoremap <leader>h :h <cr>
nnoremap <leader><Tab> <c-^> " Switch between last two buffers

" Quickly edit/reload the vimrc file
nmap <silent> <leader>fed :e $MYVIMRC<CR>
nmap <silent> <leader>feR :so $MYVIMRC<CR>

set visualbell t_vb= " no beep

set backspace=indent,eol,start "allow backspacing over everything in insert mode
set virtualedit=block

set history=1000   "store lots of :cmdline history

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set number      "show line numbers
set cursorline  " hilight current line

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set ignorecase
set smartcase
set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

if v:version >= 703
  "undo settings
  set undodir=~/.vim/undofiles
  set undofile

  set textwidth=79
  set colorcolumn=+1 "mark the ideal max text width

  "  Backups
  set nobackup               " do not keep backups after close
  set nowritebackup          " do not keep a backup while working
  set noswapfile             " don't keep swp files either
  set backupdir=~/.vim/backup " store backups under ~/.vim/backup
  set backupcopy=yes         " keep attributes of original file
  set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
  set directory=~/.vim/swap,~/tmp,. " keep swp files under ~/.vim/swap

  set cryptmethod=blowfish
endif

"default indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*/tmp/*,*/coverage/*,*/.git/*,*/node_modules/*
set wildignore+=*.gem,coverage/**,log/**,.git,tags,*.rbc,*.ttf,*.eot

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"load ftplugins and indent files
filetype plugin on
filetype indent on

syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

" STATUS LINE
" ===========
set statusline=%f       "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

if exists('fugitive#statusline')
  set statusline+=%{fugitive#statusline()}
endif

" "display a warning if &et is wrong, or we have mixed-indenting
" set statusline+=%#error#
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*
"
" set statusline+=%{StatuslineTrailingSpaceWarning()}
"
" set statusline+=%{StatuslineLongLineWarning()}

if exists('SyntasticStatuslineFlag')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endif

" display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
if exists('StatuslineCurrentHighlight')
  set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
endif
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2


" PLUGIN SETUP
" ============

" The Silver Searcher
nmap <leader>sa :Ag ''<left>
nmap <leader>saa :Ag ''<left>
nmap <leader>sai :Ag -i ''<left>
nmap <leader>saw :Ag ''

" vim-ruby
autocmd FileType rb,coffee,haml,sass autocmd BufWritePre <buffer> :%s/\s\+$//e

" NERDCommenter
nmap <leader>; <Plug>NERDCommenterToggle
vmap <leader>; <Plug>NERDCommenterToggle
let NERDSpaceDelims = 1

" set complete=.,w,b,u

" GUI SETTINGS
" ============
if has("gui_running")
  set guioptions-=T " hide toolbar
  set lines=55 columns=150

  try
    colorscheme solarized
    set background=dark
  catch
  endtry

  autocmd FocusLost * silent! :wall
else
  set t_Co=256
endif

" AUTOCMD
" =======

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" execute current line
"nmap <leader>el "lyy@l

autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
