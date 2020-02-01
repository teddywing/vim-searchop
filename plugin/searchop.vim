nnoremap <silent> <leader>a :set opfunc=Search<CR>g@
vnoremap <silent> <leader>a :<C-u>call Search(visualmode(), 1)<CR>


function! Search(type, ...)
	silent execute "normal! `[v`]y"

	let @/ = escape(@@, '\')
	call histadd('/', @/)
	normal! n
endfunction
