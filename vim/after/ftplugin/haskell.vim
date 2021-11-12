let b:undo_ftplugin = ''
if !has('nvim')
setlocal foldmethod=indent
let b:undo_ftplugin .= '|setlocal foldmethod<'
endif
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal  shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal  softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
