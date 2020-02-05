nnoremap <silent> z/ :set opfunc=SearchForward<CR>g@
vnoremap <silent> z/ :<C-u>call SearchForward(visualmode(), 1)<CR>

nnoremap <silent> z# :set opfunc=SearchBackward<CR>g@
vnoremap <silent> z# :<C-u>call SearchBackward(visualmode(), 1)<CR>


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

	let @@ = user_unnamed_register
endfunction

function! SearchForward(type, ...)
	call call('Search', [a:type] + a:000)

	call feedkeys('n', 't')
endfunction

function! SearchBackward(type, ...)
	call call('Search', [a:type] + a:000)

	call feedkeys('N', 't')
endfunction
