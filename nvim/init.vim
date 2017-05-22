" neovim config
" Dennis Reimers <d.reimers@tu-bs.de>

"dein Scripts-----------------------------
" Required:
set runtimepath^=~/.config/nvim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('.'))
" Let dein manage dein
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('neomake/neomake')
call dein#add('zchee/deoplete-clang')
call dein#add('mhartington/vim-devicons')
call dein#add('mhartington/oceanic-next')
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('majutsushi/tagbar')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('critiqjo/lldb.nvim')
call dein#add('lervag/vimtex')
call dein#add('chase/vim-ansible-yaml')
"call dein#add('albfan/ag.vim')
call dein#add('junegunn/fzf.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('Shougo/vimshell', { 'rev': '3787e5' }) " You can specify revision/branch/tag.

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" General Settings
"""""""""""""""""""""""""""""""
" Setup default encoding
set encoding=utf8
" vim mode
set nocompatible               " Be iMproved
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Line numbers
set number
" Highlight current line
set cursorline
set hidden

 " Theme
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

" spellchecker
" Toggle spell checking on and off with <leader>s
nmap <silent> <leader>s :set spell!<CR>
" Set region to Deutsch(Deutschland)
set spelllang=de_de
" but off by default
set nospell
" white-list for automatic spellchecking
" german
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.tex     setlocal spell    spelllang=de_de
" english
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
" Straight tab separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" tagbar
let g:tagbar_usearrows = 1
" key mappings
"""""""""""""""""""""""""""""""

" Leader key
let mapleader = ","
let maplocalleader = ","

" Copy/paste to/from system clipboard
map <Leader>c "+y
map <Leader>v "+p

" Save file
map <Leader>w :w<CR>

" Clear search highlighting with spacebar
nnoremap <leader><space> :noh<CR>

" Match bracket pairs with tab key
nnoremap <tab> %
vnoremap <tab> %

" shortcut to rapidly toggle `set relativenumber`
nmap <leader>r :set relativenumber!<CR>

" shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" toggle NerdTree
nmap <leader>o :NERDTreeToggle<CR>

" toggle tagbar
nnoremap <leader>t :TagbarToggle<CR>

