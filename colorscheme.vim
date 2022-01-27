" Tokyo Night Color Customization
let g:tokyonight_style="night"
let g:tokyonight_hide_inactive_statusline=1
let g:tokyonight_transparent_sidebar=1
let g:tokyonight_lualine_bold=1
let g:tokyonight_transparent=1
let g:tokyonight_italic_comments=1
" let g:tokyonight_italic_functions = 1    
let g:tokyonight_terminal_colors=1
let g:tokyonight_lualine_bold=1
" let g:tokyonight_italic_variables=1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi LineNr guifg=#5081c0 
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi Comment guifg=#5081c0 gui=italic
        \ | hi Function gui=bold
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange
        \ | hi TSKeyword gui=bold | hi Keyword gui=bold
        \ | hi Todo gui=bold
augroup END

" TODO:
augroup MyFloat
	autocmd!
	autocmd ColorScheme * hi NormalFloat guifg=#5081c0 gui=italic,bold
augroup END
