let g:transparent_bg = 1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi LineNr guifg=#5081c0 
        \ | hi CursorLineNR guifg=#FFba00
        \ | hi CursorLine guibg=#292e42
        \ | hi Comment guifg=#5081c0 gui=italic,bold
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange
        \ | hi NvimTreeNormal guifg=NONE guibg=NONE
        \ | hi Todo gui=bold
        \ | hi Visual guibg=#33467C
        \ | hi Special gui=NONE
        \ | hi TSTypeBuiltin gui=NONE " set this for dracula
        \ | hi TSKeyword gui=NONE | hi Keyword gui=NONE "gui=bold for tokyo
        \ | hi Function gui=NONE "gui=bold for tokyo
        \ | hi Normal guibg=NONE ctermbg=NONE
        \ | hi Visual guifg=black guibg=#F1FA8C " set this for dracula,
        " yellow visual selection
augroup END

augroup MyFloat
	autocmd!
	" autocmd ColorScheme * hi NormalFloat guifg=#5081c0 gui=bold "set for tokyo
augroup END
