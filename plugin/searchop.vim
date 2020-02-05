nnoremap <silent> z/ :set opfunc=Search<CR>g@
vnoremap <silent> z/ :<C-u>call Search(visualmode(), 1)<CR>


function! Search(type, ...)
	let user_unnamed_register = @@

	if a:0
		silent execute "normal! gvy"
	elseif a:type == 'line'
		silent execute "normal! '[V']y"
	else
		silent execute "normal! `[v`]y"
	endif

	let @/ = substitute(escape(@@, '\'), '\n', '\\n', 'g')
	call histadd('/', @/)

	call feedkeys('n', 't')

	let @@ = user_unnamed_register
endfunction
