" Returns WINDOWS, DARWIN, or LINUX
function! s:WhichEnv() abort
	if has('win16') || has('win32') || has('win64')
		return 'WINDOWS'
	else
		return toupper(substitute(system('uname'), '\n', '', ''))
	endif
endfunction

" Used to export hostname globally for cross-platform vimrcs
function! circumnavigate#exportSysEnv() abort
	" Prevent errors if user did not set any hostname patterns
	let l:hn = hostname()
	let g:setup_dict = {'name': l:hn, 'local': v:false,
				\ 'platform': s:WhichEnv()}
        " Is local if ~/.vim/local exists
        if !empty(globpath('~/.vim', 'local'))
            let g:setup_dict.local = v:true
        endif
endfunction

" Functions to check environment status
function! circumnavigate#isLocal() abort
	return g:setup_dict.local
endfunction

function! circumnavigate#isMac() abort
	return g:setup_dict.platform ==? 'darwin'
endfunction

function! circumnavigate#isLinux() abort
	return g:setup_dict.platform ==? 'linux'
endfunction

function! circumnavigate#isWindows() abort
	return g:setup_dict.platform ==? 'windows'
endfunction

function! circumnavigate#getName() abort
	return g:setup_dict.name
endfunction!

function! circumnavigate#getPlatform() abort
	return g:setup_dict.platform
endfunction!
