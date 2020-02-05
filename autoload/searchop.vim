" Copyright (c) 2020  Teddy Wing
"
" Searchop is free software: you can redistribute it and/or modify it
" under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" Searchop is distributed in the hope that it will be useful, but
" WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
" General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with Searchop. If not, see <https://www.gnu.org/licenses/>.

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
