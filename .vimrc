"omajinai
"----------------------------------------------------------
"set term=builtin_linux
set term=xterm
"set ttytype=builtin_linux
set mouse=a
set ttymouse=xterm2


" edit
"-----------------------------------------------------------
syntax on
set autoindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set number
set title
set clipboard=unnamed,autoselect
set guioptions+=a
set shell=zsh

" search
"-----------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set history=1000

" tab
"-----------------------------------------------------------
au FileType ruby set ts=2 sw=2 softtabstop=2 expandtab
au FileType eruby set ts=2 sw=2 softtabstop=2 expandtab
au FileType php  set ts=4 sw=4 softtabstop=4 expandtab
au FileType html set ts=2 sw=2 softtabstop=2 expandtab
au FileType js   set ts=2 sw=2 softtabstop=2 expandtab
au FileType javascript set ts=2 sw=2 softtabstop=2 expandtab
au FileType yaml set ts=2 sw=2 softtabstop=2 expandtab
au! BufNewFile,BufRead *.as :set filetype=actionscript
au! BufNewFile,BufRead *.thtml :set filetype=html
au! BufNewFile,BufRead *.phtml :set filetype=html
au! BufNewFile,BufRead *.twig :set filetype=html
au! BufNewFile,BufRead *.rb :set filetype=ruby
au! BufNewFile,BufRead *.yml :set filetype=yaml

set smarttab
inoremap <C-Tab> <C-V><Tab>

" 80........
"set textwidth=0
"if exists('&colorcolumn')
"    set colorcolumn=+1
"    " sh,cpp,perl,vim,............
"    " ..........filetype.........
"    autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme setlocal textwidth=80
"endif

"utf-8
"----------------------------------------------------------
set termencoding=utf-8
set encoding=utf-8

"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932

if &encoding == 'utf-8'
    set ambiwidth=double
endif
scriptencoding cp932

" 改行コード
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /./

"NerdTree
"---------------------------------------------------------
let NERDChristmasTree = 1
let NERDTreeShowHidden = 1
let NERDTreeDirArrows = 0
autocmd vimenter * if !argc() | NERDTree | endif
" Ctrl + e....
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>

"option
"-------------------------------------------------------------------------
set nocompatible          " We're running Vim, not Vi!
filetype off

runtime macros/matchit.vim

" neobundle....
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'taichouchou2/rsense-0.3'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-rails'

" solarized カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'

" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

"colorsheme
"---------------------------------------------------------
set t_Co=256
colorscheme jellybeans

filetype plugin indent on " Enable filetype-specific indenting and plugins

"status line
"---------------------------------------------------------
set laststatus=2
"set statusline=%F%m%r%h%w\ F=%{&ff}\ T=%Y\ A=\%03.3b\ H=\%02.2B\ P=%04l,%04v[%p%%]\ L=%L
let g:airline_theme = 'light'
let g:airline#extensions#hunks#enabled = 1

"git
let g:gitgutter_highlight_lines = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache#sources#rsense#home_directory = expand('~/.vim/bundle/rsense-0.3')
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_skip_auto_completion_time = '0.3'
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" omni補完
imap <C-space> <C-x><C-o>

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
