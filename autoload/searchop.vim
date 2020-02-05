function! s:Search(type, ...)
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

function! searchop#SearchForward(type, ...)
	call call('s:Search', [a:type] + a:000)

	call feedkeys('n', 't')
endfunction

function! searchop#SearchBackward(type, ...)
	call call('s:Search', [a:type] + a:000)

	call feedkeys('N', 't')
endfunction
