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
call dein#add('mhartington/vim-devicons')
call dein#add('mhartington/oceanic-next')
call dein#add('vim-airline/vim-airline')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('majutsushi/tagbar')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('critiqjo/lldb.nvim')
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

" lldb bindings
nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
