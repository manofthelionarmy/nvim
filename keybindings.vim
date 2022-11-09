" Reminder: zf in normal to create fold, za open fold
" TMUX
" NOTE: whichkey could be loading slow because I'm using my kebindings here,
" need to configure in whichkey.lua
let g:tmux_navigator_no_mappings = 1
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


"Barbar
nnoremap <silent> <S-l> :BufferNext<CR>
nnoremap <silent> <S-h> :BufferPrevious<CR>

" NvimTree
nnoremap <silent> tn :NvimTreeToggle<CR>
nnoremap <silent> <leader>tnf :NvimTreeFindFileToggle<CR>

" Telescope
nnoremap <silent> <leader>tc :lua require('modules/searchconfigs').search_configs()<CR>
nnoremap <silent> <leader>tl :lua require('modules/searchdir').live_grep()<CR>
nnoremap <silent> <leader>tf :lua require('modules/searchdir').find_files()<CR>
nnoremap <silent> <leader>tt :Telescope find_files<CR>
nnoremap <silent> <Space>td :lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<CR>

" Commentary key bindings
nnoremap <silent> <leader>/ :Commentary<CR>
vnoremap <silent> <leader>/ :Commentary<CR>

" VsCode stuff
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursorline at eye-level
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap g; g;zz
nnoremap g, g,zz

function! CocLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ g:coc_service_initialized == 1) " Be careful: this is a global that may change one day
endfunction

" SymbolsOutline, should I use CocOutline instead?
" function! ToggleSymbols() 
"   if CocLoaded('coc.nvim')
"     call wait(300, g:coc_service_initialized)
"     call plug#load('symbols-outline.nvim')
"     lua require('symbols-outline').toggle_outline()
"   else
"     echo("wait a sec, coc.nvim is still initializing")
"   endif
" endfunction

nnoremap <silent> <space>tb :CocOutline<CR>
nnoremap <silent> <leader>c :BufferClose!<CR>


" Remap shift 
vnoremap > >gv
vnoremap < <gv

" GitGutter
nnoremap <silent> <leader>g; :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>g, :GitGutterNextHunk<CR>
nnoremap <silent> <leader>gu :GitGutterUndoHunk<CR>
" Fold non-changes and show all of my current changes. Hit the keys again to unfold
nnoremap <silent> <leader>gf :GitGutterFold<CR>
nnoremap <silent> <leader>gs :GitGutterStageHunk<CR>

  
" DAP
nnoremap <silent> <leader>dt :lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent> <leader>db :lua require'dap'.step_back()<cr>
nnoremap <silent> <leader>dc :lua require'dap'.continue()<cr>
nnoremap <silent> <leader>dC :lua require'dap'.run_to_cursor()<cr>
nnoremap <silent> <leader>dd :lua require'dap'.disconnect()<cr>
nnoremap <silent> <leader>dg :lua require'dap'.session()<<cr>
nnoremap <silent> <leader>di :lua require'dap'.step_into()<cr>
nnoremap <silent> <leader>do :lua require'dap'.step_over()<cr>
nnoremap <silent> <leader>du :lua require'dap'.step_out()<cr>
nnoremap <silent> <leader>dp :lua require'dap'.pause.toggle()<cr> 
nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle()<cr>
" FIXME:
nnoremap <silent> <leader>ds :lua require'dap'.continue()<cr> 
nnoremap <silent> <leader>dq :lua require'dap'.close()<cr>

" Looks like nvim-tree disables netrw, which needs to be enabled to have gx
" work. Remapped it so it works
nnoremap <silent> gx :execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>

" support <c-j> and <c-k>
inoremap <silent><expr> <C-j>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
