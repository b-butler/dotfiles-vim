let b:undo_ftplugin = ''

" ---------- Local Options {{{
setlocal foldmethod=indent
let b:undo_ftplugin .= '|setlocal foldmethod<'
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=2
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=2
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal commentstring=\%\ %s
let b:undo_ftplugin .= '|setlocal commentstring<'
"  }}}
