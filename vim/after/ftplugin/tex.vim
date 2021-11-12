let b:undo_ftplugin = ''

" ---------- Local Settings {{{
if !has('nvim')
setlocal foldmethod=marker
let b:undo_ftplugin .= '|setlocal foldmethod<'
endif
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
setlocal textwidth=0
let b:undo_ftplugin .= '|setlocal textwidth<'
setlocal linebreak
let b:undo_ftplugin .= '|setlocal linebreak<'
setlocal showbreak=>
let b:undo_ftplugin .= '|setlocal showbreak<'
setlocal colorcolumn=0
"  }}}

nnoremap <buffer> j gj
nnoremap <buffer> k gk
