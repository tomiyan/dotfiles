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

" tab
"-----------------------------------------------------------
au FileType ruby set ts=2 sw=2 softtabstop=4 expandtab
au FileType php  set ts=4 sw=4 softtabstop=4 expandtab
au FileType html set ts=4 sw=4 softtabstop=2 expandtab
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

" .....
set list
set listchars=tab:>-,trail:-,extends:<,precedes:<
" ..........
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /./

"nerdTree
"---------------------------------------------------------
" .....
let NERDChristmasTree = 1
" .........
let NERDTreeShowHidden = 1
" ..............(0:..)
let NERDTreeDirArrows = 0
" .........
autocmd vimenter * if !argc() | NERDTree | endif
" ....
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
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

" neobundle....
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))


NeoBundle 'Shougo/vimproc.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'honza/snipmate-snippets'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'taichouchou2/vim-rsense'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'taq/vim-rspec'
NeoBundle 'tpope/vim-surround.git'

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
"colorscheme desert256
"colorscheme xoria256
colorscheme jellybeans

filetype plugin indent on " Enable filetype-specific indenting and plugins

"ctags
"autocmd FileType php :set tags=~/.vim/tags/homes.tags

"status line
"-------------------------------------------------------------------------
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ F=%{&ff}\ T=%Y\ A=\%03.3b\ H=\%02.2B\ P=%04l,%04v[%p%%]\ L=%L


"ruby
"source $VIMRUNTIME/macros/matchit.vim

let g:rsenseHome = "/home/tomitam/rsense-0.3"
let g:rsenseUseOmniFunc = 1

let g:neocomplcache_enable_at_startup = 1
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

" quickrun rspec
"let g:quickrun_config = {}
"let g:quickrun_config['ruby.rspec'] = {'command': "rspec"}
"augroup RSpec
"        autocmd!
"        autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
"augroup END

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

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

