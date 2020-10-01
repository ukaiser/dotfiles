" Vundle {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/Align'
Plugin 'tpope/vim-surround'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bogado/file-line'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'junegunn/fzf'
Plugin 'edkolev/promptline.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'Valloric/YouCompleteMe'
Plugin 'peterhoeg/vim-qml'
call vundle#end()            " required
" }}}
"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Plugin Settings {{{
let g:windowswap_map_keys = 0 "prevent default bindings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" Vim Linux Coding Style {{{
let g:linuxsty_patterns = [ "/linux/", "/kernel/" ]
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 "change 0 to 1 if you have a powerline font
set laststatus=2
set t_Co=256
" }}}
"
"
" NERDTree {{{
" Start NERDTree always
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
let g:NERDTreeMapChangeRoot =  "`"

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>c :NERDTreeCWD<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 25

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
" }}}


" Clang-Format {{{
function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/vim/addons/syntax/clang-format-8.py
endfunction
autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp call Formatonsave()
map <C-K> :py3f /usr/share/vim/addons/syntax/clang-format-9.py<CR>
imap <C-K> <c-o>:py3f /usr/share/vim/addons/syntax/clang-format-9.py<CR>
"  }}}

" FZF {{{
" Mapping selecting mappings
nmap <C-P> :FZF<CR>
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" }}}


" General {{{

set nocompatible
filetype off
set linebreak

set number
set relativenumber

syntax on
colorscheme onedark

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8

set autoindent
set smartindent
set cindent
set background=dark
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildignore=*.pyc
set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set undolevels=1000
set noswapfile
set nobackup
set number
set linespace=3
set hidden
set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
set clipboard=unnamedplus

" Autoreload changed files
set autoread
au CursorHold,CursorHoldI * checktime

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Some Useful Key Mappings {{{

"Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
" So we don't have to reach for escape to leave insert mode.
inoremap jk <ESC>

" Use space as leader
let mapleader = "\<Space>"

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

"Paste mode toggle
set pastetoggle=<F5><F5>

map <C-S-B> :Make <cr>
nmap <leader>O O<ESC>
nmap <leader>o o<ESC>
" }}}

"display the buffer list and promt you for a number
map <leader>b :ls<CR>:b
"
"
"
"
set exrc
set secure


