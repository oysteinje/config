" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'Mofiqul/dracula.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'arcticicestudio/nord-vim'
Plug 'pprovost/vim-ps1'
Plug 'preservim/nerdtree'
Plug 'pineapplegiant/spaceduck'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Theme
colorscheme nord

" Settings
set ignorecase
set number
set expandtab
set shiftwidth=2

"
" NERDTree config" 
"

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Mappings for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"
" End NERDTree config 
"
