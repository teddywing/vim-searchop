nnoremap <silent> z/ :set opfunc=Search<CR>g@
vnoremap <silent> z/ :<C-u>call Search(visualmode(), 1)<CR>


function! Search(type, ...)
	let user_unnamed_register = @@

	silent execute "normal! `[v`]y"

	let @/ = escape(@@, '\')
	call histadd('/', @/)

	call feedkeys('n', 't')

	let @@ = user_unnamed_register
endfunction
