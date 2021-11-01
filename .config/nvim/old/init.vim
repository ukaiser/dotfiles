
call plug#begin(expand('$HOME/.config/nvim/plugged'))
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'


Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'peterhoeg/vim-qml'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'vimwiki/vimwiki'



" Initialize plugin system
call plug#end()

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif



lua require("config")
lua require("lsp")
lua require("galaxyline.lua")
lua require("nvim-web-devicons.lua")
lua require("nvim-bufferline.lua")
lua require("nvim-treesitter.lua")





" General {{{
set number
set relativenumber

syntax enable                           " Enables syntax highlighing
colorscheme tokyonight
set nowrap                              " display long lines as just one line
set encoding=utf-8                      " The encoding displayed 
set fileencoding=utf-8                  " The encoding written to file
set ruler              	                " show the cursor position all the time
set cmdheight=2                         " always keep this at 2"
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
"set laststatus=0                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set colorcolumn=80
set signcolumn=number
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

nmap <silent> ga :ClangdSwitchSourceHeader<CR>

filetype plugin indent on               " Gives vim abilty to recognize filetypes

" Autoreload changed files
set autoread
au CursorHold,CursorHoldI * checktime

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
inoremap kj <ESC>

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

" Put a line above or below the current line
nmap <leader>O O<ESC>
nmap <leader>o o<ESC>

"display the buffer list and promt you for a number
nnoremap <leader>bb :buffers<cr>:b<space>
nnoremap <leader><tab> :b#<cr>

" close al buffers but the current
nnoremap <leader>ca :w\|%bd\|e#\|bd#\|'"<CR>
" }}}

"let &makeprg = 'ninja -C build install'
autocmd Filetype cpp set makeprg=ninja\ -C\ build\ install
autocmd Filetype rust set makeprg=cargo\ build
map <C-B> :wa<CR>:Make<CR>


" NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}

" delimitmate {{{
"
let delimitMate_balance_matchpairs = 1
"Handled with completer
"let delimitMate_expand_cr = 1
" }}}


" VIMWIKI {{{
let g:vimwiki_list = [{'path': '/mnt/hgfs/Data/nextcloud/vimwiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}



