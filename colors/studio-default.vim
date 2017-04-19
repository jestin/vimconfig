"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
	syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/default.vim

let g:colors_name = "studio-default"

"Clear the colors for any items that you don't like
hi clear StatusLine

"Set up your new & improved colors
hi StatusLine ctermbg=21
