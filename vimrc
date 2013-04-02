set nocompatible
let mapleader=","

" some dirty hacks in order rvm to work
if isdirectory(expand('~/.rvm'))
  if executable('zsh')
    set shell=zsh\ -i
  else
    set shell=sh
  endif
  let g:ruby_path = expand('~/.rvm/rubies/default/bin"')
  let $PATH = g:ruby_path . ':' . $PATH " this one is for syntastic
endif

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
" Bundle: https://github.com/altercation/vim-colors-solarized
" Bundle: https://github.com/slim-template/vim-slim.git
" Bundle: https://github.com/chrisbra/NrrwRgn
" Bundle: https://github.com/ervandew/supertab
" Bundle: https://github.com/godlygeek/tabular
" Bundle: https://github.com/kchmck/vim-coffee-script
" Bundle: https://github.com/kien/ctrlp.vim.git
" Bundle: https://github.com/mileszs/ack.vim.git
" Bundle: https://github.com/miripiruni/CSScomb-for-Vim.git
" Bundle: https://github.com/rking/ag.vim
" Bundle: https://github.com/scrooloose/nerdcommenter
" Bundle: https://github.com/scrooloose/nerdtree
" Bundle: https://github.com/scrooloose/syntastic.git
" Bundle: https://github.com/sjl/gundo.vim
" Bundle: https://github.com/tpope/vim-abolish
" Bundle: https://github.com/tpope/vim-endwise
" Bundle: https://github.com/tpope/vim-fugitive
" Bundle: https://github.com/tpope/vim-git
" Bundle: https://github.com/tpope/vim-rails
" Bundle: https://github.com/tpope/vim-rake
" Bundle: https://github.com/tpope/vim-repeat
" Bundle: https://github.com/tpope/vim-rvm.git
" Bundle: https://github.com/tpope/vim-surround
" Bundle: https://github.com/tpope/vim-unimpaired.git
" Bundle: https://github.com/vexxor/zenburn.vim.git
" Bundle: https://github.com/vim-ruby/vim-ruby
" Bundle: https://github.com/vim-scripts/Align
" Bundle: https://github.com/vim-scripts/YankRing.vim
" Bundle: https://github.com/vim-scripts/a.vim.git
" Bundle: https://github.com/vim-scripts/bufexplorer.zip
" Bundle: https://github.com/vim-scripts/matchit.zip.git
" Bundle: https://github.com/vim-scripts/taglist.vim.git
"" Bundle: https://github.com/astashov/vim-ruby-debugger
"" Bundle: https://github.com/bronson/Arduino-syntax-file
"" Bundle: https://github.com/bronson/vim-closebuffer
"" Bundle: https://github.com/bronson/vim-ruby-block-conv
"" Bundle: https://github.com/bronson/vim-toggle-wrap
"" Bundle: https://github.com/bronson/vim-trailing-whitespace
"" Bundle: https://github.com/bronson/vim-visual-star-search
"" Bundle: https://github.com/gmarik/vim-markdown
"" Bundle: https://github.com/kana/vim-textobj-user
"" Bundle: https://github.com/majutsushi/tagbar
"" Bundle: https://github.com/michaeljsmith/vim-indent-object
"" Bundle: https://github.com/nelstrom/vim-textobj-rubyblock
"" Bundle: https://github.com/pangloss/vim-javascript
"" Bundle: https://github.com/tpope/vim-markdown.git
"" Bundle: https://github.com/tpope/vim-ragtag.git
"" Bundle: https://github.com/tpope/vim-vividchalk
"" Bundle: https://github.com/vim-scripts/AutoTag
"" Bundle: https://github.com/vim-scripts/IndexedSearch
"" Bundle: https://github.com/vim-scripts/Parameter-Text-Objects
"" Bundle: https://github.com/vim-scripts/delimitMate.vim.git
"" Bundle: https://github.com/vim-scripts/jQuery

" Bundle: https://github.com/garbas/vim-snipmate
"" Bundle: https://github.com/honza/snipmate-snippets.git
" Bundle: https://github.com/MarcWeber/vim-addon-mw-utils.git
" Bundle: https://github.com/tomtom/tlib_vim.git

" Bundle: https://github.com/wincent/Command-T.git
"" BundleCommand: cd Command-T && rvm system exec rake make
"" TODO: Bundle: https://github.com/hallettj/jslint.vim

" NO PLUGIN SETUP
" ===============

set autoread
set autowrite
set hidden
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
"nmap <leader>q :bdelete<CR>
"nmap <leader>d :bdelete<CR>
nmap <leader>D :bdelete!<CR>
nmap <leader>w :w<CR>
nnoremap <leader>h :h <cr>
nnoremap <leader><space> :nohls<CR>
nnoremap <leader><leader> <c-^> " Switch between last two buffers

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
set wildignore+=*/tmp/*,*/coverage/*,*/.git/*
set wildignore+=*.gem,coverage/**,log/**,.git,tags,*.rbc,*.ttf,*.eot

set tags+=tmp/tags
"set formatoptions-=o "dont continue comments when pushing o/O

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

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nmap <leader>a :Ack<space>
nmap <leader>aa :Ack<space>

" CtrlP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPCurWD'
"nmap <leader>f :CtrlP<cr>

" vim-ruby
autocmd FileType rb,coffee,haml,sass autocmd BufWritePre <buffer> :%s/\s\+$//e

" NERDCommenter
nmap <leader>/ <Plug>NERDCommenterToggle
vmap <leader>/ <Plug>NERDCommenterToggle

" NERDTree
nmap <leader>nf :NERDTreeFind<cr>
nmap <leader>nt :NERDTreeToggle<cr>

" easymotion
  let g:EasyMotion_leader_key = '<Leader>m'

" Command T
nmap <leader>t :CommandTFlush<cr>:CommandT<cr>
nmap <leader>bt :CommandTBuffer<cr>

" snipmate
let g:snippets_dir = "$HOME/.vim/snippets"

" YankRing
let g:yankring_history_dir = '$HOME/.vim/'
nmap <leader>y :YRShow<CR>

" set complete=.,w,b,u

" GUI SETTINGS
" ============
if has("gui_running")
  set guioptions-=T " hide toolbar
  set lines=55 columns=100

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

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call <SID>Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" Create a mapping (e.g. in your .vimrc) like this:
"nmap <C-W>! <Plug>Kwbd
nmap <leader>bd <Plug>Kwbd
nmap <leader>d <Plug>Kwbd
nmap <leader>q <Plug>Kwbd

" move up and down
nmap <C-j> <C-d>
nmap <C-k> <C-u>


" execute current line
"nmap <leader>el "lyy@l

" rails
nmap ,rr :e config/routes.rb<cr>
nmap ,raj :e app/assets/javascripts/application.js.coffee<cr>
nmap ,ras :e app/assets/stylesheets/application.css.scss<cr>
nmap ,rah :e app/views/layouts/application.html.haml<cr>
nmap ,rs :Rserver!<cr>
nmap ,ri :Rmigration<cr>
nmap ,rm :Rmodel<cr>
nmap ,rv :Rview<space>
nmap ,rc :Rcontroller<cr>
nmap ,rt :Rtags<cr>
nmap ,ral :Rlayout<cr>
nmap ,rj :Rjavascript<cr>
nmap ,rs :Rspec<cr>
nmap ,rxi :Rmigration<space>
nmap ,rxm :Rmodel<space>
nmap ,rxv :Rview<space>
nmap ,rxc :Rcontroller<space>
nmap ,rxt :Rtags<space>
nmap ,rxl :Rlayout<space>
nmap ,rxj :Rjavascript<space>
nmap ,rxs :Rspec<space>
nmap ,rsh :%s/:\(\w\+\)\s*=>/\1:/gc<cr>
vmap ,rsh :s/:\(\w\+\)\s*=>/\1:/gc<cr>

nmap <leader>rtv :CommandTFlush<cr>\|:CommandT app/views<cr>
nmap <leader>rtc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
nmap <leader>rtm :CommandTFlush<cr>\|:CommandT app/models<cr>
nmap <leader>rth :CommandTFlush<cr>\|:CommandT app/helpers<cr>
nmap <leader>rtl :CommandTFlush<cr>\|:CommandT lib<cr>
nmap <leader>rtp :CommandTFlush<cr>\|:CommandT public<cr>
nmap <leader>rts :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
nmap <leader>rtj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
nmap <leader>rta :CommandTFlush<cr>\|:CommandT app/assets<cr>
