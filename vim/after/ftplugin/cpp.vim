let b:undo_ftplugin = ''
if !has('nvim')
setlocal foldmethod=syntax
let b:undo_ftplugin .= '|setlocal foldmethod<'
endif
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal shiftwidth=4
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal softtabstop=4
let b:undo_ftplugin .= '|setlocal softtabstop<'
" ---------- Ale Settings {{{
let b:ale_fixers = ['clang-format-11']
let b:undo_ftplugin .= '|let b:ale_fixers = []'
let b:ale_linters = ['clangd', 'remove_trailing_lines', 'trim_whitespace']
let b:undo_ftplugin .= '|let b:ale_linters = []'
"  }}}
