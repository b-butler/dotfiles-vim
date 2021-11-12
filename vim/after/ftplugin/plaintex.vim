let b:undo_ftplugin = ''
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
setlocal noexpandtab
let b:undo_ftplugin .= '|setlocal noexpandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal tabstop=4
let b:undo_ftplugin .= '|setlocal tabstop<'
setlocal listchars=tab:\|\  
let b:undo_ftplugin .= '|setlocal listchars<'
setlocal list
let b:undo_ftplugin .= '|setlocal list<'
