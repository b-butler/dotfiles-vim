let b:undo_ftplugin = ''
" ---------- Ale Settings {{{
let b:ale_fixers=['jq']
let b:undo_ftplugin .= '|let b:ale_fixers = []'
let b:ale_linters=['jq']
let b:undo_ftplugin .= '|let b:ale_linters = []'
"  }
