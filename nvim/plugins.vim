" {{{ Tmux
" https://blog.bugsnag.com/tmux-and-vim/
" https://github.com/jgdavey/tslime.vim
" https://github.com/christoomey/vim-tmux-navigator
" https://github.com/mhinz/neovim-remote
" https://old.reddit.com/r/neovim/comments/aex45u/integrating_nvr_and_tmux_to_use_a_single_tmux_per/
" https://leanpub.com/the-tao-of-tmux/read
" }}}
" " {{{ Plug

call plug#begin('~/.config/nvim/plugins/plugged')

" Plug 'bfredl/nvim-miniyank'

Plug 'vim-scripts/YankRing.vim'
" Plug 'machakann/vim-highlightedyank'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'prendradjaja/vim-vertigo'
Plug 'w0rp/ale'
Plug 'farmergreg/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'vivien/vim-linux-coding-style'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'christoomey/vim-titlecase'
Plug 'junegunn/goyo.vim'
Plug 'jjaderberg/vim-ft-asciidoc'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'vim-utils/vim-husk'
Plug 'ap/vim-buftabline'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-commentary'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/ingo-library'
Plug 'haya14busa/incsearch.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/AdvancedSorters'
call plug#end()

" }}}
" {{{ badwolf
let g:badwolf_tabline = 1
let g:badwolf_darkgutter = 1
let g:badwolf_css_props_highlight = 1
let g:badwolf_html_link_underline = 1
"}}}
" {{{ incsearch
map #  <Plug>(incsearch-nohl-#)
map *  <Plug>(incsearch-nohl-*)
map ;  <Plug>(incsearch-forward)
map g/  <Plug>(incsearch-backward)
let g:incsearch#magic = '\v'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#separate_highlight = 1
let g:incsearch#consistent_n_direction = 1
" }}}
" {{{ enh. jumps
let g:stopFirstAndNotifyTimeoutLen = 500
" }}}
"" {{{ buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_plug_max = 35
let g:buftabline_indicators = 1
""}}}
" {{{ easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
let g:EasyMotion_keys = 'qwertyasdfghzxcvbnmQWER1234'
" }}}
" {{{ titlecase
" let g:titlecase_map_keys = 0
" }}}
" {{{ vimcompletesme
" KEYBINDINGS
"
"Keyword completion  : Ctrl-X_Ctrl-N
" File path completion: Ctrl-X_Ctrl-F
" Omni-completion     : Ctrl-X_Ctrl-O
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}
" {{{ syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <c-x>Y :SyntasticToggleMode<cr><c-w>j:close<cr>:echo "Syntastic Toggle"<cr>
nnoremap <c-x>y :SyntasticToggleMode<cr>

" disable syntastic by default
" https://github.com/vim-syntastic/syntastic/issues/101#issuecomment-209268936
let g:syntastic_mode_map = { 'mode': 'passive' }

" }}}
" {{{ camelcase
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
" }}}
" {{{ ultisnips
" Trigger configuration.
" Do not use <tab> if you use YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsListSnippets="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" }}}
" {{{ autopairs
let g:AutoPairsShortcutToggle = '<c-x>S'
let g:AutoPairsShortcutJump = '<c-x>'
" }}}
" {{{ vertigo
nnoremap <silent> , :<C-U>VertigoDown n<CR>
vnoremap <silent> , :<C-U>VertigoDown v<CR>
onoremap <silent> , :<C-U>VertigoDown o<CR>

let g:Vertigo_homerow = 'asdfghjklo'
let g:Vertigo_onedigit_method = 'smart4'
" }}}
" {{{ yankring
"fix for yankring and neovim
" https://github.com/neovim/neovim/issues/2642#issuecomment-218232937
let g:yankring_clipboard_monitor=0
" }}}
" {{{ miniyank
" map p <Plug>(miniyank-autoput)
" map P <Plug>(miniyank-autoPut)

" map <leader>n <Plug>(miniyank-cycle)
" map <leader>N <Plug>(miniyank-cycleback)

" nnoremap <c-x>n <Plug>(miniyank-cycle)
" nnoremap <c-p> <Plug>(miniyank-cycleback)

" map <leader>p <Plug>(miniyank-startput)
" map <leader>P <Plug>(miniyank-startPut)

" map <Leader>c <Plug>(miniyank-tochar)
" map <Leader>i <Plug>(miniyank-toline)
" map <Leader>b <Plug>(miniyank-toblock)
" }}}
" {{{ hl yank
" Assign a number of time in milliseconds.
" let g:highlightedyank_highlight_duration = 100
" }}}
" vim: set filetype=vim:
