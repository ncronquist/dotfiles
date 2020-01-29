"=====================================================================
" Plugins
"=====================================================================

call plug#begin('~/.vim/plugged')

" fzf allows for fuzzy file finding both in zsh and vim
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Nerdtree is a filetree for vim
Plug 'preservim/nerdtree'
" Nerdtree-git-plugin shows the git status of files in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nerdtree-syntax-highlight adds extra highlighting to the nerdtree icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Adds filetype icons to nerdtree
Plug 'ryanoasis/vim-devicons'

call plug#end()


"=====================================================================
" Mappings
"=====================================================================

" Set leader key to space
map <space> <leader>

" Better splitting
" Creates splits like tmux except with leader key instead of prefix
nnoremap <leader>- :split<CR>
nnoremap <leader>\| :vsplit<CR>

" Better split switching
" Switches splits like tmux except with leader key instead of prefix
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l


"=====================================================================
" Plugin Specific Mappings and Configuration
"=====================================================================

" ========== fzf ==========

" Set ctrl+p to fuzzy file search with fzf similar to VSCode
nnoremap <C-p> :<C-u>FZF<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ========== NERDTree ==========

" Open Nerdtree like file tree on VSCode
map <C-b> :NERDTreeToggleVCS<CR>

" Open Nerdtree to currently open file
map <C-f> :NERDTreeFind<CR>

" Show Dot Files in NERDTree
let NERDTreeShowHidden=1

" Hide the help command in NERDTree
let NERDTreeMinimalUI = 1

" Close vim if Nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

