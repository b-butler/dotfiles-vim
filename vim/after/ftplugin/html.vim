let b:undo_ftplugin = ''
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=2
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=2
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal colorcolumn=101
let b:undo_ftplugin .= '|setlocal colorcolumn<'
setlocal textwidth=100
let b:undo_ftplugin .= '|setlocal textwidth<'
if !has('nvim')
setlocal foldmethod=syntax
let b:undo_ftplugin .= '|setlocal foldmethod<'
endif
