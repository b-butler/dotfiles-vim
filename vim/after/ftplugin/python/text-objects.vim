" Class text-object
CreateBlockMappings ^\s*class c

" function text-object
CreateBlockMappings ^\s*def f
"
" condition text-object
CreateBlockMappings \v^\s*(if\|elif\|else) d

" loop text-object
CreateBlockMappings \v^\s*(for\|while\|else) l

" try-except text-object
CreateBlockMappings \v^\s*(try\|except\|else) t
