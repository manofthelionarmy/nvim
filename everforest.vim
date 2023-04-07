let g:everforest_background = 'medium'
let g:everforest_better_performance = 1
let g:everforest_transparent_background = 1

augroup MyColors
	autocmd!
	autocmd ColorScheme * hi CursorLineNR guifg=#FFba00
        \ | hi Comment gui=italic,bold
        \ | hi ErrorMsg gui=undercurl
        \ | hi WarningMsg gui=undercurl
        \ | hi AleWarningLine gui=undercurl,bold guifg=orange
        \ | hi Todo gui=bold
        \ | hi link TSRainbowRed Red
        \ | hi link TSRainbowYellow  Yellow
        \ | hi link TSRainbowBlue Blue
        \ | hi link TSRainbowOrange Orange
        \ | hi link TSRainbowGreen Green
        \ | hi link TSRainbowViolet Purple
        \ | hi link TSRainbowCyan Blue
        " \ | hi TSKeyword gui=NONE | hi Keyword gui=NONE "gui=bold for tokyo
        " \ | hi Function gui=NONE 
      " \ | hi Visual guifg=black guibg=#F1FA8C " set this for dracula
augroup END
