" Try to source a file if it exists
function! private#SourceIfExists(filename)
	if exists('a:filename')
		try
			execute 'source ' . a:filename
		catch
			echom 'File "' . a:filename . '" could not be sourced.'
		endtry
	endif
endfunction
