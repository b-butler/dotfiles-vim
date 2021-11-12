let g:vimwiki_list = [wiki_1, wiki_2]
" Redefine VimWikiLinkHandler function to have vfile option
  function! VimwikiLinkHandler(link)
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
  endfunction

let b:undo_ftplugin = ''
setlocal expandtab
let b:undo_ftplugin .= '|setlocal expandtab<'
setlocal  shiftwidth=2
let b:undo_ftplugin .= '|setlocal shiftwidth<'
setlocal  softtabstop=2
let b:undo_ftplugin .= '|setlocal softtabstop<'
setlocal  textwidth=100
let b:undo_ftplugin .= '|setlocal textwidth<'
setlocal colorcolumn=100
let b:undo_ftplugin .= '|setlocal colorcolumn<'
setlocal spell
let b:undo_ftplugin .= '|setlocal spell<'
