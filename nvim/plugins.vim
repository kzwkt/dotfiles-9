" " {{{ Plug
call plug#begin('~/.config/nvim/plugins/plugged')
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'prendradjaja/vim-vertigo'
Plug 'farmergreg/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-titlecase'
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'vim-utils/vim-husk'
Plug 'ap/vim-buftabline'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'
Plug 'ajh17/VimCompletesMe'
Plug 'tpope/vim-commentary'
Plug 'haya14busa/incsearch.vim'
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
map g;  <Plug>(incsearch-forward)
map g/  <Plug>(incsearch-backward)
let g:incsearch#magic = '\v'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#separate_highlight = 1
let g:incsearch#consistent_n_direction = 1
" }}}
"" {{{ buftabline
let g:buftabline_show = 1
let g:buftabline_numbers = 2
let g:buftabline_plug_max = 35
let g:buftabline_indicators = 1
""}}}
" {{{ vimcompletesme
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
" {{{ sneak
nnoremap gf f
nnoremap gF F
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#label = 1
let g:sneak#s_next = 1
let g:sneak#target_labels = "asdfhjklqwertyu"
" }}}
"vim: set filetype=vim:
