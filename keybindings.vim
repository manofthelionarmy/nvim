" Reminder: zf in normal to create fold, za open fold
" TMUX
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

" Telescope
nnoremap <silent> <leader>tc :lua require('modules/searchconfigs').search_configs()<CR>
nnoremap <silent> <leader>tl :lua require('modules/searchdir').live_grep()<CR>
nnoremap <silent> <leader>tf :lua require('modules/searchdir').find_files()<CR>
nnoremap <silent> <leader>tt :Telescope find_files<CR>

" Commentary key bindings
nnoremap <silent> \/ :Commentary<CR>
vnoremap <silent> \/ :Commentary<CR>

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

" SymbolsOutline
function! ToggleSymbols() 
  if CocLoaded('coc.nvim')
    call wait(300, g:coc_service_initialized)
    call plug#load('symbols-outline.nvim')
    lua require('symbols-outline').toggle_outline()
  else
    echo("wait a sec, coc.nvim is still initializing")
  endif
endfunction

nnoremap <silent> tb :call ToggleSymbols()<CR>
nnoremap <silent> \c :BufferClose<CR>


" Remap shift 
vnoremap > >gv
vnoremap < <gv

" GitGutter
nnoremap <silent> \gp :GitGutterPrevHunk<CR>
nnoremap <silent> \gn :GitGutterNextHunk<CR>
nnoremap <silent> \gl :GitGutterUndoHunk<CR>
