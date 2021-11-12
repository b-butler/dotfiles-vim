let b:undo_ftplugin = ''

" ---------- Local Options {{{
if !has('nvim')
	setlocal foldmethod=indent
	let b:undo_ftplugin .= '|setlocal foldmethod<'
endif
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
"  }}}
" ---------- Ale Settings {{{
let b:ale_fixers = ['black']
let b:ale_python_black_options = '-l 80'
let b:undo_ftplugin .= '|let b:ale_fixers = []'
let b:ale_linters = ['flake8', 'remove_trailing_lines', 'trim_whitespace']
let b:undo_ftplugin .= '|let b:ale_linters = []'
"  }}}
" Table Helper Settings --------------- {{{
let b:table_mode_corner_corner='+'
let b:table_mode_header_fillchar='='
" }}}
