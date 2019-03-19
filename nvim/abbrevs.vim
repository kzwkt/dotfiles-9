" {{{ iabbrevs
" iabbrev b!! #!/bin/bash<c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbrev b!! #!/usr/bin/env bash<cr>
iabbrev p!! #!/usr/bin/python3<c-r>=Eatchar('\m\s\<bar>/')<cr><cr>
iabbrev ~!! /home/mrblack/<c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbrev n!! ~/.config/nvim/<c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbrev -!! —
iabbrev !!! ¦
iabbrev modeline!! " vim: ft=vim:<c-r>=Eatchar('\m\s\<bar>/')<cr>
iabbrev null &>/dev/null
" }}}
" {{{ cabbrevs

cabbrev autoformat set formatoptions+=tcqa
cabbrev noautoformat set formatoptions=jcroql

cabbrev path! let @+ = expand("%:p") <bar> echo "path yanked"
cabbrev runthis write! <bar> silent !%:p <bar> echo "file executed"
cabbrev deletethisfile :!sudo trash-put % <bar> echo "file deleted"

cabbrev nurnu set nu rnu
cabbrev nonu set nonu nornu
cabbrev wrap! set wrap! linebreak! nolist!
cabbrev ic! set ignorecase! <bar> set ignorecase?

cabbrev nostatus call StatusOff()
cabbrev status! call StatusWordCount()
cabbrev lightstatus silent call StatusLight()

cabbrev blank g/^\_$\n\_^$/d

cabbrev  lipsum :Loremipsum

cabbrev en setlocal spell! spelllang=en
cabbrev pt setlocal spell! spelllang=pt

cabbrev cn   source $MYVIMRC <bar> PlugClean
cabbrev clean   source $MYVIMRC <bar> PlugClean

cabbrev ins source $MYVIMRC <bar> PlugInstall
cabbrev install! source $MYVIMRC <bar> PlugInstall

cabbrev sthis silent so %
cabbrev sourcethis silent so %

cabbrev sinit! source $MYVIMRC<bar>:noh<bar>echo ""<cr>

cabbrev sourceinit source $MYVIMRC

cabbrev == wincmd =<cr>

" }}}

" nnoremap <silent> <leader>g :exe ':silent !google-chrome --no-sandbox % &'<cr>
" vim: nowrap
