if exists('g:loaded_searchop')
	finish
endif
let g:loaded_searchop = 1


nnoremap <silent> <Plug>(searchop-forward) :set opfunc=searchop#SearchForward<CR>g@
vnoremap <silent> <Plug>(searchop-forward)
	\ :<C-u>call searchop#SearchForward(visualmode(), 1)<CR>

nnoremap <silent> <Plug>(searchop-backward) :set opfunc=searchop#SearchBackward<CR>g@
vnoremap <silent> <Plug>(searchop-backward)
	\ :<C-u>call searchop#SearchBackward(visualmode(), 1)<CR>


if !hasmapto('<Plug>(searchop-forward)') && !maparg('z*', 'n')
	nmap z* <Plug>(searchop-forward)
	vmap z* <Plug>(searchop-forward)
endif

if !hasmapto('<Plug>(searchop-backward)') && !maparg('z#', 'n')
	nmap z# <Plug>(searchop-backward)
	vmap z# <Plug>(searchop-backward)
endif
