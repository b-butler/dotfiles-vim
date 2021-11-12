" Base settings -------------- {{{
let b:undo_ftplugin = ''
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal textwidth=100
let b:undo_ftplugin .= '|setlocal textwidth<'
setlocal colorcolumn=101
let b:undo_ftplugin .= '|setlocal colorcolumn<'
" }}}
" Table Helper Settings --------------- {{{
let b:table_mode_corner_corner='+'
let b:table_mode_header_fillchar='='
" }}}
