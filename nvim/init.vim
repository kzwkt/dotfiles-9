" {{{ source
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/mappings.vim
so ~/.config/nvim/abbrevs.vim
" }}}
" {{{ options
" " {{{ basic
set hls
" " {{{ tabulation
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
" }}}

set title
set backup
set nu rnu
set hidden
set showcmd
set gdefault
set modeline
set undofile
set wildmenu
set autoread
set showmatch
set notimeout
set ttimeout
set autochdir
set lazyredraw
set autoindent
set noshowmode
set noswapfile
set splitbelow
set splitright
set shiftround
set cursorline
set guioptions=
set matchtime=3
set nocompatible
set cedit=\<c-y>
set history=1000
set autowriteall
set showbreak =.
set synmaxcol=200
set regexpengine=1
set conceallevel=3
set updatetime=1000
set ttimeoutlen=10
set foldlevelstart=0
set undolevels=50000
set undoreload=50000
set virtualedit=block
set foldmethod=marker
set inccommand=nosplit
set wildmode=list:longest
set shortmess=aoOtIsTWAqF
set clipboard+=unnamed,unnamedplus
set omnifunc=syntaxcomplete#Complete
set undodir=~/.config/nvim/.undodir
set backupdir=~/.config/nvim/.backupdir
set backspace=indent,eol,start

syntax on
filetype plugin on
colorscheme badwolf
syntax sync minlines=256
filetype plugin indent on
let g:python_host_prog ='/usr/bin/python2.7'
let g:python3_host_prog ='/usr/local/bin/python3'
" hide ugly tidles
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" }}}
" {{{ formatting
set nowrap
set nolist
set mouse=a
set linebreak
set display+=lastline
""}}}
" {{{ searching and movement
set hlsearch
set smartcase
set incsearch
set showmatch
set ignorecase
""}}}"}}}
" {{{ functions
" {{{ eatchar
func! Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc
iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
" }}}
" {{{ autosave
" augroup AutoSave
" 	autocmd!
" 	autocmd FocusLost   *  :silent! wall
" 	autocmd InsertEnter *  :silent! wall
" 	autocmd InsertLeave *  :silent! wall
" 	autocmd BufLeave    *  :silent! wall
" 	autocmd CmdlineLeave * :silent! wall
" 	autocmd CmdlineLeave * :noh
" augroup END
" }}}
" {{{ status
set laststatus=2
hi statusLine ctermfg=yellow
hi statusline ctermbg=black

set statusline=\ %f\ %y
set statusline+=\ \|\ %(%{strftime('%a\ \|\ %eⁿᵈ\ \|\ %H:%M')}%)
set statusline+=\ \|\ \ %m
set statusline+=%=
set statusline+=\ \|\ %02vᶜ
set statusline+=\ \|\ %02pᵖ
set statusline+=\ \|\ %03l/%-L\

function! StatusWordCount()
	set laststatus=2
	set statusline=%f%y%m
	set statusline+=%=
	set statusline+=%{WordCount()}ʷ
	set statusline+=\ \|\ %02vᶜ
	set statusline+=\ \|\ %02pᵖ
	set statusline+=\ \|\ %03l/%-L\
endfunction

function! StatusNoWordCount()
	set laststatus=2
	set statusline=%f%y%m
	set statusline+=%=
	set statusline+=\ \|\ %02vᶜ
	set statusline+=\ \|\ %02pᵖ
	set statusline+=\ \|\ %03l/%-L\
endfunction

function! StatusOff()
	setlocal laststatus=0
	setlocal statusline=
endfunction

function! StatusLight()
	set laststatus=2
	set statusline=\ %f\ %m
endfunction

function! WordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	return n
endfunction

function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline ctermbg=darkgrey
		hi statusline ctermfg=yellow
	elseif a:mode == 'r'
		hi statusline ctermbg=red
	else
		hi statusline ctermbg=black
	endif
endfunction

augroup status
	autocmd!
	autocmd InsertEnter * call InsertStatuslineColor(v:insertmode)
	autocmd InsertChange * call InsertStatuslineColor(v:insertmode)
	autocmd InsertLeave * hi statusline ctermbg=black
	autocmd InsertLeave * hi statusline ctermfg=yellow
augroup END
" }}}
" {{{ term insert
" augroup nterm
" 	autocmd!
"         autocmd BufWinEnter,WinEnter term://* startinsert
"         autocmd BufLeave term://* stopinsert
" augroup END
augroup TermExtra
  autocmd!
  autocmd BufEnter term://* start!
augroup end
" }}}
" {{{ cursor position
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
" }}}
" {{{ st fix
" if &term =~ '256color'
"     " disable Background Color Erase (BCE) so that color schemes
"     " render properly when inside 256-color tmux and GNU screen.
"     " see also http://sunaku.github.io/vim-256color-bce.html
"     set t_ut=
" endif
" " }}}
" {{{ remove menus from GUI
let did_install_default_menus = 1
" }}}
" {{{ avoid nesting
" if has('nvim')
"   let $VISUAL = 'nvr -cc split --remote-wait'
"   let $EDITOR = 'nvr -cc split --remote-wait'
" endif
" }}}
" " {{{ jump to last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" " }}}
" {{{ sameline
" nnoremap <c-a> /Sim\\|Não/1<cr>Ji,<esc>:noh<cr>

function SameLine()
    execute "normal! gg/foo\<cr>dd"
endfunction

" }}}
" {{{ term macro

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Remove Trailling ws
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

autocmd BufWritePre *.c,*.vim :call <SID>StripTrailingWhitespaces()

" }}}
" vim: nowrap
