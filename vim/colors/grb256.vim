" Based on
runtime colors/ir_black.vim

let g:colors_name = "grb256"

hi pythonSpaceError ctermbg=red guibg=red

hi Comment ctermfg=darkgrey

hi! link SignColumn Normal
hi TabLineFill ctermbg=15 ctermfg=234
hi TabLine ctermbg=234 ctermfg=lightgray cterm=none
hi TabLineSel ctermfg=white ctermbg=18

hi StatusLineNC ctermbg=234 ctermfg=white
hi StatusLine ctermbg=17 ctermfg=white

hi VertSplit ctermbg=234 ctermfg=236
hi FoldColumn ctermbg=NONE

hi LineNr ctermfg=darkgray
hi CursorLine     guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE        ctermbg=NONE
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE      ctermfg=yellow       ctermbg=NONE        cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=236    cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=16       ctermbg=red         cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=red         cterm=NONE
hi SpellBad       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16       ctermbg=160         cterm=NONE

" ir_black doesn't highlight operators for some reason
hi Operator        guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue   ctermbg=NONE        cterm=NONE

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

" For the gutter stuff
hi! lineAdded ctermfg=darkgreen
hi! lineModified ctermfg=darkblue
hi! lineRemoved ctermfg=darkred

hi diffAdded ctermfg=darkgreen
hi diffRemoved ctermfg=darkred

highlight PmenuSel ctermfg=16 ctermbg=156

hi rubyKeywordArgument ctermfg=219
