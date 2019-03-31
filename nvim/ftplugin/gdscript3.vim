inoremap ; :<cr>
inoremap : ;<cr>
inoremap * <space>*<space>
inoremap , ,<space>
inoremap <silent> <esc> <esc>:silent w<cr>
nnoremap <silent> i :silent w<cr>i
nnoremap <silent> a :silent w<cr>a
call deoplete#custom#option({'deoplete-options-max_list': 10, 'deoplete-options-ignore_case': v:true})



