"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
	syntax reset
endif

"Load the 'base' colorscheme - the one you want to alter
runtime colors/pablo.vim

"Override the name of the base colorscheme with the name of this custom one
let g:colors_name = "my-pablo"

"Clear the colors for any items that you don't like
hi clear Visual

"Set up your new & improved colors
hi Visual ctermbg=90 gui=none
