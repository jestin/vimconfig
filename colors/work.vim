"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
	syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/default.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "work"

"Clear the colors for any items that you don't like
hi clear StatusLine

"Set up your new & improved colors
highlight StatusLine ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Pmenu ctermfg=15 ctermbg=8 guifg=#ffffff guibg=#333333
highlight PmenuSel ctermfg=250 ctermbg=0 guifg=#ffffff guibg=#000000
highlight CursorLine cterm=NONE ctermbg=17 guibg=#00005f
highlight CursorColumn cterm=NONE ctermbg=17 guibg=#00005f
