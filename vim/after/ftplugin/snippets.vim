let b:undo_ftplugin = ''
setlocal foldmethod=marker
let b:undo_ftplugin .= '|setlocal foldmethod<'
setlocal noexpandtab
let b:undo_ftplugin .= '|setlocal noexpandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal tabstop=4
let b:undo_ftplugin .= '|setlocal tabstop<'
