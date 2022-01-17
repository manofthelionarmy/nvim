# Neovim

## Debugging

## Completion

## Linting

Coc does a lot out of the box, autocompletion (obviously)
autosuggestions, diagnostics, linting (based on your lsp), 
fixing linting errors, display sybmols in via an outline tree, etc.

We want coc to primarily be used for autocompletion and autosuggestions
and leave the linting and correcting linting errors to ale.

### Setup

Setup for ale involves editing coc-settings.json, setting our linters,
and setting our linting-fixers.

### Coc Config

First, make sure that these settings in your coc-settings.json file
are removed:

- `"coc.preferences.formatOnSaveFiletypes": ["*"]`
- `"coc.preferences.formatOnType": true` <- this is set to false by default

Make sure to uninstall coc-prettier and coc-eslint.

### Ale global settings

Next, we need to set some settings in init.vim our a vimscript file

```
let g:ale_lint_on_text_changed=0 " Don't let ale eat up resources
let g:ale_lint_on_insert_leave=1 " We want to only do linting on insert leave
  let g:ale_lint_on_enter=1      " Or lint on insert enter
let g:ale_lint_on_save=1         " Lint on save
let g:ale_set_highlights=0       " Cosmetic
let g:ale_set_quickfix = 1       " Ale linting errors will be forwarded to quickfix. Ale and coc-diagnostics share this
let g:ale_set_loclist=1          " Ale linting errors will be forwarded to here too
let g:ale_cursor_detail=0
let g:ale_set_signs=1            " Cosmetic, we want to display signs
let g:ale_virtualtext_cursor=1
let g:ale_change_sign_column_color=0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_list_vertical=1
let g:ale_sign_info = ''
let g:ale_fix_on_save=1 "Let ale do the work for autoformatting, not coc
```
### Ale Linters and Fixers

Lastly, we want to explicitly set our ale linters and our fixers
Must have fixers installed! Globally for golang, locally for javascript.

```
let g:ale_linters={
      \ 'javascript': ['prettier', 'eslint'],
      \ 'go': ['golangci-lint'] 
      \}

let g:ale_go_golangci_lint_executable = 'golangci-lint'

let g:ale_go_golangci_lint_options = '' " don't use the default, with is --enable-all

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'go': ['gofumpt', 'gofmt'],
      \}
```

### Disclaimer about golangci-lint

It's fairly agressive on linting errors. It enforces us to create pkgs
if we are importing functions external to main pkg. It also errors if we
aren't checking errors. We can always use another linter.

### Checking for Supported Linters and Fixers

Run :help ale to find supported linters.
Run :ALEFixSuggestions and you'll see supported fixers.
