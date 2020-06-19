" ---- basic.vim ----
set runtimepath+=$HOME/.vim
set nocompatible

" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" sound
set noerrorbells
set novisualbell
if has("gui_running")
    autocmd GUIEnter * set vb t_vb=
endif

" file writing
set autoread
set autowrite
set ruler
set magic
set showmatch

" encoding
set fileencoding=UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk,,shift-jis,gb2312
set termencoding=UTF-8
set encoding=UTF-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
source $VIMRUNTIME/mswin.vim
behave mswin
language messages en_US.UTF-8

" mouse
set mouse=a
" set selection=exclusive
set selection=inclusive
set selectmode=mouse,key

" plugins
set noignorecase
filetype on
filetype plugin on
filetype indent on
syntax on
syntax enable
set noundofile
set nobackup
set noswapfile
set nowritebackup

" fix bug for gvim
" map Q <Nop>

" no more window
set completeopt=menu

" fold code
set foldenable
set foldmethod=indent
set foldnestmax=99
set foldlevel=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" indent
set cindent
set smartindent
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" display
set showcmd
set hlsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set clipboard+=unnamed

set list listchars=tab:>-,trail:.,extends:>
set modifiable

set cursorline
set nocursorcolumn
set norelativenumber
set number
set laststatus=2

if has("gui_running")
    " gvim toolbox
    set guioptions-=T
    " gvim menu
    set guioptions-=m
endif

set hidden
set updatetime=100
set cmdheight=2

" Yubo defined
set hidden
set number
" set relativenumber
set cursorline
" 突入显示当前列
set cursorcolumn
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=7 " keep 5 lines offset to the bottom and top
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=10
set updatetime=300
"set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
nnoremap gv `[v`]
"在insert模式下能用删除键进行删除
set formatoptions-=tc
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set signcolumn=yes
" set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
