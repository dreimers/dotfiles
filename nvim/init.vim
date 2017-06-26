" neovim config
" Dennis Reimers <d.reimers@tu-bs.de>

"dein Scripts-----------------------------
" Required:
set runtimepath^=~/.config/nvim/repos/github.com/Shougo/dein.vim
" local fzf
set rtp+=~/.fzf
call dein#begin(expand('~/.config/nvim/'))
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
call dein#add('tpope/vim-surround')
call dein#add('vim-ctrlspace/vim-ctrlspace')
call dein#add('critiqjo/lldb.nvim')
call dein#add('lervag/vimtex')
call dein#add('chase/vim-ansible-yaml')
"call dein#add('albfan/ag.vim')
call dein#add('junegunn/fzf.vim')
call dein#add('junegunn/vim-easy-align')
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

" vim-easyalign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" turn on deoplete
let g:deoplete#enable_at_startup = 1

" setup deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" turn of preview window on completion
set completeopt-=preview
"
" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
