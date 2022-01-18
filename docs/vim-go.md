# Vim-go

Make sure to have these setting set. We don't want to clash with coc.nvim

```
let g:go_def_mapping_enabled = 0    " We're using coc jump to definition
let g:go_code_completion_enabled=0  " we're using coc for code completion
let g:go_gopls_enabled = 0          " we're using coc-go
let g:go_echo_go_info = 0           " Optional, I don't like the stuff printed out
let g:go_imports_autosave = 0       " We have ale doing this for us via goimports ale_fixer :)
let g:go_fmt_autosave = 0           " We have ale fix on save :)
let g:go_doc_keywordprg_enabled = 0 " Set it to 0 so vim-go doesn't override K mapping for CocAsyncAction('doHover')
```
