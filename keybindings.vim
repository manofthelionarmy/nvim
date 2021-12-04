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

function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir))
endfunction

" SymbolsOutline
function! ToggleSymbols() 
  if PlugLoaded('coc.nvim')
    call plug#load('symbols-outline.nvim')
    lua require('symbols-outline').toggle_outline()
  endif
endfunction

nnoremap <silent> tb :call ToggleSymbols()<CR>
nnoremap <silent> \c :BufferClose<CR>


" Remap shift 
vnoremap > >gv
vnoremap < <gv
