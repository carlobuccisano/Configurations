call plug#begin()
" List of plugins

" VimTeX
Plug 'lervag/vimtex'

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" UltiSnips
Plug 'SirVer/ultisnips'

let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']  " using Neovim

call plug#end()

" A tab is 4 spaces long
set tabstop=4
set shiftwidth=4
" Replace tab with spaces
" set expandtab 
