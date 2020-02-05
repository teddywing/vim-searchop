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
