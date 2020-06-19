" Key Operations
let mapleader=" "

" switch between C/C++ header source
map <F1> :CocCommand clangd.switchSourceHeader<CR>
" open terminal
map <F2> :terminal ++rows=20<CR>
" next color
map <F3> :NextColor<CR>
" open/close nerdtree file explorer
map <F5> :NERDTreeToggle<CR>

" Command Operations

" copy visual selection to disk cache
vnoremap <Leader>y :w! ~/.cache/.lin.vim.copypaste<CR>
" copy disk cache to cursor
nnoremap <Leader>p :r ~/.cache/.lin.vim.copypaste<CR>

" Highlight a word
nmap z :let @/=expand('<cword>')<cr>

map ; :

" Remap U to <C-r> for easier redo
nnoremap U <C-r>

" Copy to system clipboard
if has('macunix') "Mac
    vnoremap Y :.w !pbcopy <CR><CR>
elseif has('unix') "Linux
    vnoremap Y :.w !xclip -i -sel c<CR>
endif

" Search
let hlstate=0
nnoremap <LEADER><CR> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" noremap <LEADER><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
noremap <LEADER>tt :%s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Disable space
:nnoremap <space> <Nop>

" Disable ex-mode
:nnoremap Q <Nop>

" Disable adding number
:nnoremap <c-a> <Nop>

" Cursor Movement
" N key: go to the start of the line
noremap <silent> H ^
" I key: go to the end of the line
noremap <silent> L $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" ===
" === Window management
" ===

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Maximize window and return to previous split structure
nnoremap <C-W>o :call MaximizeToggle()<CR>
" nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
" nnoremap <C-W>O :call MaximizeToggle()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

" Place the two screens up and down
noremap spj <C-w>t<C-w>K
" Place the two screens side by side
noremap sph <C-w>t<C-w>H

" Rotate screens
noremap srk <C-w>b<C-w>K
noremap srh <C-w>b<C-w>H

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tt :tabe<CR>
" Move around tabs with tn and ti
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmp :-tabmove<CR>
noremap tmn :+tabmove<CR>
" Close the tab
noremap tx :tabclose<CR>


" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

"insert a newline
inoremap <C-O> <Esc>o

" ===
" === Buffer management
" ===
" Write buffer (save)
noremap <LEADER>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"switch buffer
nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>

"delete buffer
nnoremap <C-x>  :bd<CR>

"switch windw
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k

"smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabline operation
" noremap <LEADER>tn :tabnew<CR>
" noremap <LEADER>te :tabedit
" noremap <LEADER>tm :tabmove

"buffer
" nnoremap <LEADER>bc :BufOnly<CR>
" nnoremap <LEADER>bo :BufOnly
"yank to end
" nnoremap Y y$

" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" Vim-json qoutes concealing
" nmap <LEADER>cl :set conceallevel=2<CR>
" nmap <LEADER>ncl :set conceallevel=0<CR>
nnoremap <LEADER>nc :call QuoteConcealToggle()<CR>
" nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
" nnoremap <C-W>O :call MaximizeToggle()<CR>

function! QuoteConcealToggle()
    if &conceallevel == 2
        set conceallevel=0
    else
        set conceallevel=2
    endif
endfunction

" Press ` to change case (instead of ~)
noremap ` ~

"noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h
