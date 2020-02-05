nnoremap <silent> z* :set opfunc=searchop#SearchForward<CR>g@
vnoremap <silent> z* :<C-u>call searchop#SearchForward(visualmode(), 1)<CR>

nnoremap <silent> z# :set opfunc=searchop#SearchBackward<CR>g@
vnoremap <silent> z# :<C-u>call searchop#SearchBackward(visualmode(), 1)<CR>
