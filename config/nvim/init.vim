
" Set ctrl+p to fuzzy file search with fzf similar to VSCode
nnoremap <C-p> :<C-u>FZF<CR>

call plug#begin('~/.vim/plugged')

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

call plug#end()
