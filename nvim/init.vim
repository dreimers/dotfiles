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
call dein#add('junegunn/fzf.vim')
call dein#add('junegunn/vim-easy-align')
call dein#add('junegunn/rainbow_parentheses.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('AndrewRadev/switch.vim')
call dein#add('Shougo/vimshell')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-repeat')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('tommcdo/vim-exchange')
call dein#add('AndrewRadev/sideways.vim')
call dein#add('zchee/deoplete-jedi')
call dein#add('kana/vim-textobj-user')
call dein#add('lucapette/vim-textobj-underscore')
call dein#add('thinca/vim-textobj-between')
call dein#add('ludovicchabant/vim-gutentags')
call dein#add('mbbill/undotree')

" colorschemes
call dein#add('mhartington/oceanic-next')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('tpozzi/Sidonia')
call dein#add('hauleth/blame.vim')
call dein#add('skielbasa/vim-material-monokai')
call dein#add('nightsense/simplifysimplify')
call dein#add('nightsense/seagrey')
call dein#add('nightsense/forgotten')
call dein#add('cnj4/horseradish256')

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
set nocompatible

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Line numbers
set number

" Highlight current line
set cursorline
set hidden
" ignore case on search if all lowercase
set ignorecase
set smartcase

" turn on mouse-support
set mouse=a

" color support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext

let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1

" Straight tab separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" tagbar
let g:tagbar_usearrows = 1

" No underlined CursorLine
hi CursorLine cterm=None

" turn of preview window on completion
set completeopt-=preview

" Use undo files
set undofile

" key mappings
"""""""""""""""""""""""""""""""
" Leader key
let mapleader = ","

" Copy/paste to/from system clipboard
map <Leader>c "+y
map <Leader>v "+p

" fix annoyance :Q != :q
cnoremap Q q

" Save file
map <Leader>w :w<CR>

" Clear search highlighting with spacebar
nnoremap <leader><space> :noh<CR>:let @/ = ""<CR>

" Close quick-fix window
nnoremap <Leader>qq :ccl<CR><silent>

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
nnoremap <leader>T :TagbarToggle<CR>

" fzf mappings
noremap <Leader>t :Tags <C-R>=expand('<cword>')<CR><CR>
noremap gb :Buffers <CR>
noremap gF :Files <CR>
noremap gT :Windows <CR>
noremap <Leader>gb :FZFBookmarks <CR>
nnoremap q: :History:<CR>

" FZF
" https://www.reddit.com/r/neovim/comments/3oeko4/post_your_fzfvim_configurations/cvxev6j/
" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>

" lldb bindings
nmap <M-b> <Plug>LLBreakSwitch
vmap <F2> <Plug>LLStdInSelected
nnoremap <F4> :LLstdin<CR>
nnoremap <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
nnoremap <F7> :LL step<CR>
nnoremap <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>

" undotree mappings
nnoremap <Leader>U :UndotreeToggle<CR>

" vim-easyalign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" select last changed eg last paste
" from: http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" neosnippet
" Plugin key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" sideways key-mappings
nnoremap <Leader>sr :SidewaysRight<cr>
nnoremap <Leader>sl :SidewaysLeft<cr>
nnoremap <C-h> :SidewaysJumpLeft<cr>
nnoremap <C-l> :SidewaysJumpRight<cr>

" sideways text-objects (on args)
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Neomake
" enable linter on buffer write
call neomake#configure#automake('w')

" Turn on spell check on some filetypes
au BufNewFile,BufRead,BufEnter   *.tex     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us

" PLUGIN SETTINGS
" fzf
command! FZFBookmarks call fzf#run({
		\	'source': 'cat ~/.NERDTreeBookmarks|cut -d" " -f2',
		\	'sink': 'e',
		\	'options': '--prompt "Bookmark> "',
		\	'down': '20%'})

" turn on deoplete
let g:deoplete#enable_at_startup = 1

" setup deoplete-clang
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
