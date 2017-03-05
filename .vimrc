"utf-8
"----------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
scriptencoding utf-8

if &encoding == 'utf-8'
    set ambiwidth=double
endif

"----------------------------------------------------------
set term=xterm
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
set cursorline
set shell=zsh
set noswapfile
set scrolloff=5
set pumheight=10

" inclement/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" yank
nnoremap Y y$

" clipboard
set clipboard+=unnamed

" search
"-----------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan
set history=1000

augroup vimrc
    autocmd!
augroup END

au vimrc FileType ruby set ts=2 sw=2 softtabstop=2 expandtab
au vimrc FileType php  set ts=4 sw=4 softtabstop=4 expandtab
au vimrc FileType html set ts=4 sw=4 softtabstop=2 expandtab
au vimrc FileType javascript set ts=2 sw=2 softtabstop=2 expandtab
au vimrc FileType yaml set ts=2 sw=2 softtabstop=2 expandtab
au vimrc FileType jinja set ts=4 sw=4 softtabstop=2 expandtab
au vimrc FileType vim set ts=4 sw=4 softtabstop=4 expandtab
au! vimrc BufNewFile,BufRead *.as :set filetype=actionscript
au! vimrc BufNewFile,BufRead *.thtml :set filetype=html
au! vimrc BufNewFile,BufRead *.phtml :set filetype=html
au! vimrc BufNewFile,BufRead *.twig :set filetype=jinja
au! vimrc BufNewFile,BufRead *_spec.rb :set filetype=ruby syntax=rspec
au! vimrc BufNewFile,BufRead *.rb :set filetype=ruby
au! vimrc BufNewFile,BufRead *.yml :set filetype=yaml
au! vimrc BufNewFile,BufRead *.js :set filetype=javascript
au! vimrc BufNewFile,BufRead *.vimrc :set filetype=vim

set smarttab
inoremap <C-Tab> <C-V><Tab>

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

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
" NeoBundle 'take/rsense-0.3'
" NeoBundle 'Shougo/neocomplcache-rsense.git'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'gregsexton/gitv'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'jgdavey/vim-blockle'
NeoBundle 'lepture/vim-jinja'
NeoBundle 'sakuraiyuta/commentout.vim.git'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'


NeoBundle 'Yggdroot/indentLine'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'scrooloose/syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" incsearch
" NeoBundle 'haya14busa/incsearch.vim'
" NeoBundle 'haya14busa/incsearch-fuzzy.vim'

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" map z/ <Plug>(incsearch-fuzzyspell-/)
" map z? <Plug>(incsearch-fuzzyspell-?)
" map zg/ <Plug>(incsearch-fuzzyspell-stay)

" jellybeans カラースキーム
NeoBundle 'nanotech/jellybeans.vim'

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
let g:airline_theme = 'light'
let g:airline#extensions#hunks#enabled = 1

" neocomplcache
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_force_overwrite_completefunc = 1
" let g:neocomplcache#sources#rsense#home_directory = expand('~/.vim/bundle/rsense-0.3')
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_skip_auto_completion_time = '0.3'

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
" imap <C-space> <C-x><C-o>

let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" indent
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

" vim-easy-align
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" vim-gitgutter
let g:gitgutter_max_signs = 1000

" json
set conceallevel=0
let g:vim_json_syntax_conceal = 0
