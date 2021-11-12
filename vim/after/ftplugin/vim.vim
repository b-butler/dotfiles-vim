let b:undo_ftplugin = ''
setlocal foldmethod=marker
let b:undo_ftplugin .= '|setlocal foldmethod<'
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
