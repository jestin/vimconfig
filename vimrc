" common misspellings
iab teh the
iab fuction function
iab funtion function

" enter the current millenium
set nocompatible

" remap leader
let mapleader = ","

" use undo files
set undofile

" comment current fold
nnoremap <leader>k [z<C-v>]zI//<Esc>

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" set recursive file path
set path+=**
set wildmenu
set wildignore+=**/node_modules/**

" custom commands
command! MakeTags !ctags -R .

fun! HideGutter( arg ) "{{{
    sign unplace *
    set nonumber
endfunction "}}}
command! -nargs=* HideGutter call HideGutter ( '<args> ' )

call plug#begin('~/.vim/plugged')

" Makes those funny alignment issues trivial.
Plug 'junegunn/vim-easy-align'

" he way to navigate a file quickly, regardless of language.
Plug 'Lokaltog/vim-easymotion'

" Automatically match pairs intelligently.
Plug 'Raimondi/delimitMate'

" The best completion engine I’ve found.
Plug 'Valloric/YouCompleteMe'

Plug 'ternjs/tern_for_vim'

" allows you to edit your quickfix list and write the changes to their files.
" Like find and replace, but better.
Plug 'Olical/vim-enmasse'

" The way to jump around your code base by rough file names.
Plug 'ctrlpvim/ctrlp.vim'

" We work with a lot of it, show it some love.
Plug 'elzr/vim-json'

" Git info in the gutter.
Plug 'mhinz/vim-signify'

" My favourite JavaScript syntax plugin of them all so far. (has great conceal
" features which I’ll talk about below)
Plug 'pangloss/vim-javascript'

" We have to search for a lot of stuff across a lot of files, Ag does it best.
Plug 'rking/ag.vim'

" Provides automatic JSHint linting. (among many other JavaScript linters,
" check the docs)
Plug 'scrooloose/syntastic'

" file tree support
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'burnettk/vim-angular'

Plug 'othree/html5.vim'

Plug 'tmhedberg/matchit'

Plug 'alvan/vim-closetag'

Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'editorconfig/editorconfig-vim'

Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'tpope/vim-fugitive'

Plug 'majutsushi/tagbar'

Plug 'tommcdo/vim-fubitive'

Plug 'vim-scripts/Gundo'

Plug 'nelstrom/vim-qargs'

Plug 'altercation/vim-colors-solarized'

call plug#end()

set backspace=2 " make backspace work like most other apps"
set number

" easy motion prefix
map <Leader> <Plug>(easymotion-prefix)

" modernize searching
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" easily reload a file from disk if externally modified
nnoremap <leader>r :edit<cr>

" toggles the tree with ctrl-n
map <C-n> :NERDTreeToggle<CR>

" automatically closed the tree window when the last non-tree window is closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files in the tree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.o$','\.a$','\.dylib$']

" allows for ctrl-c copying to the system clipboard from visual mode
vnoremap <C-c> "*y"

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_error_symbol = '❌'
" let g:syntastic_style_error_symbol = '⁉️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'

let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
map <C-z> <nop>
nnoremap <leader>z :SyntasticReset<CR>

" indentation settings
set tabstop=4
set shiftwidth=4
au FileType html,yaml set tabstop=2
au FileType html,yaml set shiftwidth=2
set expandtab
au FileType c,cpp,h,H,cxx,C,cs,java, set noexpandtab

" status line
set statusline=%f " is overwritten below as part of vim-fugitive configs
set laststatus=2

" code folding
set foldmethod=syntax
set foldlevelstart=20

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

let g:vim_json_syntax_conceal=0

autocmd FileType html,xml setlocal foldmethod=indent

" workaround for conflicts with closetag and delimitmate
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.php"
au FileType xml,html,phtml,php,xhtml,js let b:delimitMate_matchpairs = "(:),[:],{:}"

" for markdown previewer
let vim_markdown_preview_github=1

" vim-fugitive stuff
set diffopt+=vertical
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
autocmd BufReadPost fugitive://* set bufhidden=delete
set splitbelow

" YCM stuff
let g:ycm_autoclose_preview_window_after_completion=1

" UltiSnips stuff
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/vim-snippets/UltiSnips"

" Tabbar stuff
nmap <C-t> :TagbarOpenAutoClose<CR>

" signify settings
let g:signify_vcs_list = [ 'git' ]

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Gundo
nnoremap <C-g> :GundoToggle<CR>

" OmniSharp configs
" filetype plugin on
" let g:OmniSharp_host = "http://localhost:2000"
" let g:OmniSharp_timeout = 1
" set noshowmatch
" set completeopt=longest,menuone,preview
" set splitbelow
" let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" 
" augroup omnisharp_commands
"     autocmd!
"     autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
"     autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
"     autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
"     autocmd BufWritePost *.cs call OmniSharp#AddToProject()
"     autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
"     autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
"     autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
"     autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
"     autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
"     autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
"     autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
"     autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
"     autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
"     autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
"     autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
"     autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"     autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
" 
" augroup END
" 
" set updatetime=500
" set cmdheight=2
" nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
" nnoremap <leader>nm :OmniSharpRename<cr>
" nnoremap <F2> :OmniSharpRename<cr>
" command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" nnoremap <leader>rl :OmniSharpReloadSolution<cr>
" nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" nnoremap <leader>tp :OmniSharpAddToProject<cr>
" nnoremap <leader>ss :OmniSharpStartServer<cr>
" nnoremap <leader>sp :OmniSharpStopServer<cr>
" nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" set hidden
" let g:OmniSharp_want_snippet=1
