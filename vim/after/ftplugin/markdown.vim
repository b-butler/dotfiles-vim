" Base Settings ---------------- {{{
let b:undo_ftplugin = ''
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal textwidth=0
let b:undo_ftplugin .= '|setlocal textwidth<'
setlocal linebreak
let b:undo_ftplugin .= '|setlocal linebreak<'
setlocal showbreak=>
let b:undo_ftplugin .= '|setlocal showbreak<'
setlocal colorcolumn=0
let b:undo_ftplugin .= '|setlocal colorcolumn<'

nnoremap <buffer> j gj
nnoremap <buffer> k gk
" }}}
" Table Helper Settings --------------- {{{
let b:table_mode_corner='|'
" }}}
