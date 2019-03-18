let mapleader ="\<space>"

" {{{ windows

nnoremap <silent> <m-h> <c-w>h
nnoremap <silent> <m-h> <c-w>h
nnoremap <silent> <m-l> <c-w>l
nnoremap <silent> <m-j> <c-w>j
nnoremap <silent> <m-k> <c-w>k

nnoremap <silent> <leader>wv :vs<cr>
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>ws :sp<cr>
nnoremap <silent> <leader>wo :only<cr>
nnoremap <silent> <leader>0 :silent close<cr>
nnoremap <leader>' :qa!<cr>
nnoremap ! :qa!<cr>
nnoremap Q :wqa!<cr>

nnoremap <leader>q :bunload<cr>
nnoremap <leader>x :bd!<cr>

nnoremap <silent> ç <c-w>w
nnoremap <silent> <m-9> :only<cr>
nnoremap <silent> <m-0> :bunload<cr>
nnoremap <silent> <leader>0 :close<cr>

nnoremap <silent> <leader>k :split<cr><c-w>
nnoremap <silent> <leader>j :split<cr>
nnoremap <silent> <leader>h :vsplit<cr><c-w>w
nnoremap <silent> <leader>l :vsplit<cr>

nnoremap <silent> <leader>K :botright split<cr><c-w>
nnoremap <silent> <leader>J :botright split<cr>
nnoremap <silent> <leader>H :botright vsplit<cr><c-w>w
nnoremap <silent> <leader>L :botright vsplit<cr>

" RESIZE WINDOWS
" <c-w>=    balance windows
" ctrl-w +  increase height of current window by 1 line
" ctrl-w -  decrease height of current window by 1 line
" ctrl-w _  maximise height of current window
" ctrl-w |  maximise width of current window

" MOVE WINDOWS
" ctrl-w r  rotate all windows
" ctrl-w x  exchange current window with its neighbour
" ctrl-w H  move current window to far left
" ctrl-w J  move current window to bottom
" ctrl-w K  move current window to top
" ctrl-w L  move current window to far right

" }}}
" movement {{{
nnoremap <leader>ts :let &scrolloff=999-&scrolloff<cr>:echo " Toggle Centered Cursor"<cr>
nmap <leader>u <Plug>(easymotion-W)
nnoremap <c-x>s :e  ~/.config/nvim/plugins/plugged/vim-snippets/snippets/c.snippets<cr>

nnoremap <c-x>i :w!<cr>:so ~/.config/nvim/plugins.vim<cr>:PlugInstall<cr>
nnoremap <c-x>c :w!<cr>:so ~/.config/nvim/plugins.vim<cr>:PlugClean<cr>

nnoremap <c-x>l :LinuxCodingStyle<cr>:echo "Linux Coding Style"<cr>
nnoremap <c-x>r :w!<cr>:so %<cr>:echo " file loaded"<cr>
nnoremap <M-o> <c-o>
nnoremap <M-i> <c-i>
nnoremap <M-d> :Buffers<cr>
nnoremap <M-u> :Ag<cr>
nnoremap <leader>r :Ranger<cr><c-\><c-n>:set nonu nornu<cr>:echo ""<cr>i
nnoremap j mzj`z
nnoremap g, g,zz
nnoremap g; g;zz
nnoremap n nzvzmzvzz
nnoremap n nzvzmzvzz
nnoremap <silent> ge g_
nnoremap <silent> gr vg_
nnoremap <silent> zn zmzvzz
nnoremap <space>= :botright help<space>
nnoremap <c-s>u :%s/

nnoremap <silent> - :silent! helpclose<cr>
nnoremap <silent> <expr> j (v:count? 'j' : 'gj')
nnoremap <silent> <expr> k (v:count? 'k' : 'gk')
" }}}
" {{{ editing

" paste from insert
inoremap <c-v> <c-r>+
inoremap <c-x>v <c-v>

" remove blank lines
nnoremap <c-x>B :g/^$/d<cr>

" remove double blank lines
nnoremap <c-x>b :%s/\(\n\n\)\n\+/\1/<cr>:noh<cr>:echo ""<cr>

" indent buffer
nnoremap <c-x>i mzgg=G`z0w

" just one space
nnoremap <m-space> :s/\s\+/ /g<cr>W:noh<cr>:echo ""<cr>

nnoremap <m-.> .
nnoremap go o<esc>
nnoremap gi O<esc>
vnoremap <silent> <leader>ce :SortByWidth<cr>
nnoremap <silent> <leader>cd mzyyp`zj
nnoremap <silent> <esc> :silent! wa!<cr>:noh<cr>:echo ""<cr>

" }}}
" {{{ commands

nnoremap ; :
" nnoremap <c-z> <nop>
nnoremap <leader>g  :Goyo<cr>
nnoremap <silent> <cr> i<cr><esc>
nnoremap <silent> <leader>k :silent bd!<cr>

" }}}
"{{{ emacs like
" kill line
inoremap <c-k> <c-o>D

" kill backwards line
inoremap <c-u> <c-o>d0

" undo
inoremap <c-_> <c-o>u

" up and down line
inoremap <c-n> <c-o>j
inoremap <c-p> <c-o>k

" my paragraph motions
inoremap <M-p> <esc>{^
inoremap <M-n> <esc>}^
nnoremap <M-p> k{j^
nnoremap <M-n> }j^

" sentences
inoremap <M-e> <c-o>)
inoremap <M-a> <c-o>(
nnoremap <M-e> )
nnoremap <M-a> (

" line motions
nnoremap <c-a> g0
nnoremap <c-e> g$
inoremap <c-a> g0
inoremap <c-e> g$

nnoremap <c-m-i> <c-a>
nnoremap <c-x>h ggVG

nnoremap <silent> <M-s> :silent b#<cr>:echo ""<cr>
vnoremap <silent> <M-s> <esc>:silent b#<cr>:echo ""<cr>

nnoremap <silent> <tab> :silent execute "normal! za"<cr>

nnoremap <silent> <c-M-n> :silent bnext<cr><c-\><c-n>:echo ""<cr>
nnoremap <silent> <c-M-p> :silent bprev<cr><c-\><c-n>:echo ""<cr>

nnoremap <silent> <c-x><c-x> :wqa!<cr>
inoremap <silent> <c-x><c-x> <c-o>:wqa!<cr>

nnoremap gf f
nnoremap gF F
nmap f <plug>(easymotion-lineanywhere)
vmap f <plug>(easymotion-lineanywhere)
nmap ga <Plug>Titlecase
vmap ga <Plug>Titlecase
nmap gT <Plug>TitlecaseLine

" }}}
" {{{ terminal
nnoremap <m-2> @
tnoremap <esc> <c-\><c-n>
tnoremap <m-return> <c-\><c-n>:bd!<cr>
nnoremap <m-return> :term<cr><cr><cr>isp<cr>cc<cr>rr<space>
" }}}
" vim: nowrap
