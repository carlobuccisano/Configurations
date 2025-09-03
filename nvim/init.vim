call plug#begin()
" List of plugins

" Denops.vim (to allow plugin written in JavaScript/TypeScript with deno
" runtime)
"Plug 'vim-denops/denops.vim'

" Dark deno-powered completion plugin from Shougo (github)
"Plug 'shougo/ddc.vim'

"Ddc's native UI
"Plug 'Shougo/ddc-ui-native'

" Ddc source around
"Plug 'Shougo/ddc-source-around'

" VimTeX
Plug 'lervag/vimtex'


" UltiSnips
Plug 'SirVer/ultisnips'

" UndoTree
Plug 'mbbill/undotree'

call plug#end()

" denops configuration
"let g:denops#deno = '/usr/bin/deno'

" ddc.vim config

" You must set the default ui.
"call ddc#custom#patch_global('ui', 'native')

" Use around source.
"call ddc#custom#patch_global('sources', ['around'])

" Use ddc.
"call ddc#enable()

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Close braces in omni-completion for VimTeX
let g:vimtex_complete_close_braces = 1
" Custom syntax concealing commands in VimTeX
let g:vimtex_syntax_custom_cmds = [
			\{'name': 'C', 'mathmode' : 1, 'concealchar' : 'ℂ'},
			\{'name': 'E', 'mathmode' : 1, 'concealchar' : '𝔼'},
		    \{'name': 'S', 'mathmode' : 1, 'concealchar' : '𝓢'},
			\{'name': 'A', 'mathmode' : 1, 'concealchar' : '𝔸'},
			\{'name': 'L', 'mathmode' : 1, 'concealchar' : '𝕃'},
			\{'name': 'T', 'mathmode' : 1, 'concealchar' : '𝕋'},
			\{'name': 'g', 'mathmode' : 1, 'concealchar' : '𝖌'},
			\{'name': 'G', 'mathmode' : 1, 'concealchar' : '𝔾'},
			\{'name': 'infcatname', 'mathmode' : 1, 'conceal' : 1, 'argstyle': 'bold'},
			\]
" UltiSnips configuration
"
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']  " using Neovim

" A tab is 4 spaces long
set tabstop=4
set shiftwidth=4
" Replace tab with spaces
" set expandtab 

set number 
set scrolloff=10
set spell
set spelllang=en_gb,en_us,fr,it

" Activate concealing but remove its dark grey highlighting
"set conceallevel=2
highlight Conceal ctermbg=none ctermfg=none guibg=none guifg=none


