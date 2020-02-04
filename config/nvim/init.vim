"=====================================================================
" Plugins
"=====================================================================

" Use vim-plug for managing vim plugins
" https://github.com/junegunn/vim-plug
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

" Plugin to manage editorconfig
" https://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" Rooter changes working directory to project root
Plug 'airblade/vim-rooter'

call plug#end()

"=====================================================================
" Style
"=====================================================================

" Set the line number coloring to dark gray
highlight LineNr ctermfg=DarkGrey

" Turn on highlighting for the current line number
set cursorline
highlight CursorLine cterm=NONE
highlight CursorLineNr ctermbg=DarkGrey

"=====================================================================
" Settings
"=====================================================================

set number                      " Show line numbers
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set clipboard+=unnamedplus      " Use the system clipboard by default
set mouse=a                     " Enable mouse support
set undofile                    " Save undos after file closes
set undodir=~/.cache/vim        " where to save undo histories
set hidden                      " Hide buffer with unsaved changes
                                "   instead of closing it when new
                                "   buffers are opened

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

" Remove search highlights (after searching for text, space-space
" will remove the highlighting)
nnoremap <leader><space> :nohlsearch<CR>

"=====================================================================
" Plugin Specific Mappings and Configuration
"=====================================================================

" ========== fzf ==========

" Set ctrl+p to fuzzy file search with fzf similar to VSCode
nnoremap <C-p> :<C-u>FZF<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" ========== NERDTree ==========

" Toggle NERDTree
noremap <Leader>n :NERDTreeToggleVCS<CR>

" Open Nerdtree to currently open file
noremap <Leader>f :NERDTreeFind<CR>

" Show Dot Files in NERDTree
let NERDTreeShowHidden=1

" Hide the help command in NERDTree
let NERDTreeMinimalUI = 1

" Close vim if Nerdtree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

