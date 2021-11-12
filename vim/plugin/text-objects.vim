function! s:GetBlockEdge_(line, indent, interval)
	" Returns a list that gives the line boundaries of a indention block
	"
	" line (int) : the line to start search from
	" indent (int) : the indent level to use as the minimum indent level for
	"   a block
	" interval (int) : The lines to move when checking block extent.
	"   (positive checks further down the file and negative further up)
	"
	" Returns
	" block (list) : [block beginning, block ending]
	let l:edge = a:line
	let l:temp = l:edge + a:interval
	while indent(l:temp) >= a:indent
		let l:edge = l:temp
		let l:temp += a:interval
	endwhile
	return l:edge
endfunction

function! s:GetBlockEdge(line, interval)
	" Returns a list that gives the line boundaries of a indention block
	"
	" line (int) : the line to start search from
	" interval (int) : The lines to move when checking block extent.
	"   (positive checks further down the file and negative further up)
	"
	" Returns
	" block (list) : [block beginning, block ending]
	return <SID>GetBlockEdge_(a:line, indent(a:line), a:interval)
endfunction

function! s:GetBlock()
	" Returns a list that gives the line boundaries of a indention block
	" using the current line.
	"
	" Returns
	" block (list) : [block beginning, block ending]
	let l:curr_line = line('.')
	let l:indent = indent('.')
	return [<SID>GetBlockEdge_(l:curr_line, l:indent, -1),
		\<SID>GetBlockEdge_(l:curr_line, l:indent, 1)]
endfunction

function! GetInnerBlockWithRegex(pat)
	" Returns a list that gives the line boundaries of a pattern block.
	" A pattern block is defined as beginning at a line matching a pattern
	" followed by lines that have a greater indention level. An inner block
	" does not include the line matched by the pattern.
	"
	" pat (string) : the regex pattern that defines the beginning of the
	"   block
	"
	" Returns
	" block (list) : [block beginning, block ending]
	" In case of error, function returns 0.
	let l:curr_pos = getcurpos()
	let l:indent = indent('.')
	" If indent equals 0 then no match could be found
	if l:indent == 0
		return
	endif
	" search returns 0 when pattern does not match
	let l:new_line = search(a:pat, 'bW')
	while l:new_line != 0
		if indent(l:new_line) < l:indent
			let l:new_line += 1
			return [l:new_line,
				\<SID>GetBlockEdge(l:new_line, 1)]
		endif
		let l:new_line = search(a:pat, 'bW')
	endwhile
	" If no match with proper indenting is found move cursor back
	call cursor(l:curr_pos[1], l:curr_pos[2])
	return
endfunction

function! GetOuterBlockWithRegex(pat)
	" Returns a list that gives the line boundaries of a pattern block.
	" A pattern block is defined as beginning at a line matching a pattern
	" followed by lines that have a greater indention level.
	"
	" pat (string) : the regex pattern that defines the beginning of the
	"   block
	"
	" Returns
	" block (list) : [block beginning, block ending]
	" In case of error, function returns 0.

	" If current line matches pattern return that outer block
	if getline('.') =~# a:pat
		return [line('.'), <SID>GetBlockEdge(line('.') + 1, 1)]
	endif
	" Else search to see if in a block matching a:pat
	let l:block = GetInnerBlockWithRegex(a:pat)
	if type(l:block) != type([])
		return -1
	else
		return [l:block[0] - 1, l:block[1]]
	endif
endfunction

function! SelectBlock(block)
	" Select a line range in V-mode
	"
	" block (list): The start and stop of the block to select
	if type(a:block) != type([])
		return
	else
		execute 'normal! ' . string(a:block[1]) . 'GV' .
			\string(a:block[0]) . 'G'
	endif
endfunction

function! s:CreateBlockMappings(pat, map_end)
	" Create operation pending and visual mode mappings for pattern block.
	" The mapping i . map_end is used for the inner block and o . map_end
	" for outer block mappings.
	"
	" pat (string) : the regex pattern defining the block
	" map_end (string) : the suffix for the mappings
	let l:in_maps = 'i' . a:map_end
	let l:out_maps = 'a' . a:map_end
	execute 'onoremap ' . l:in_maps . ' :call ' .
		\" SelectBlock(GetInnerBlockWithRegex('" . a:pat . "'))<cr>"
	execute 'onoremap ' . l:out_maps . ' :call' .
		\" SelectBlock(GetOuterBlockWithRegex('" . a:pat . "'))<cr>"
	execute 'xnoremap ' . l:in_maps . ' :call ' .
		\" SelectBlock(GetInnerBlockWithRegex('" . a:pat . "'))<cr>"
	execute 'xnoremap ' . l:out_maps . ' :call' .
		\" SelectBlock(GetOuterBlockWithRegex('" . a:pat . "'))<cr>"
endfunction

command! SelectIndentionBlock :call SelectBlock(<SID>GetBlock())
command! -nargs=+ CreateBlockMappings :call <SID>CreateBlockMappings(<f-args>)
