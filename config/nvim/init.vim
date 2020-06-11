"=====================================================================
" Plugins
"=====================================================================

" Use vim-plug for managing vim plugins
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" fzf allows for fuzzy file finding both in zsh and vim
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" ack allows for recursively searching through text in a directory
Plug 'mileszs/ack.vim'

" Nerdtree is a filetree for vim
Plug 'preservim/nerdtree'
" Nerdtree-git-plugin shows the git status of files in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Nerdtree-syntax-highlight adds extra highlighting to the nerdtree icons
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Adds filetype icons to nerdtree
Plug 'ryanoasis/vim-devicons'

" Allows for inserting or deleting brackets, parens, and quotes in pairs
Plug 'jiangmiao/auto-pairs'

" Plugin to manage editorconfig
" https://editorconfig.org/
Plug 'editorconfig/editorconfig-vim'

" Rooter changes working directory to project root
Plug 'airblade/vim-rooter'

" Adds a collection of language packs for vim
" Only supports syntax and indentation; Other features are skipped
" If more functionality is needed for any lanuage, that specific language
" plugin must be installed
Plug 'sheerun/vim-polyglot'

" Adds syntax highlighting for hashicorp sentinel language
Plug 'hashicorp/sentinel.vim'

" Allows for quickly commenting/uncommenting code
Plug 'preservim/nerdcommenter'

" Displays git diff in the gutter (sign column)
Plug 'airblade/vim-gitgutter'

" Adds status/tabline at the bottom of vim panes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nord theme - https://www.nordtheme.com/
Plug 'arcticicestudio/nord-vim'

call plug#end()


"=====================================================================
" Style
"=====================================================================

" Turn on highlighting for the current line number
set cursorline
let g:nord_cursor_line_number_background = 1

" Turn on the nord colorscheme
" All configuration variables must be set **before** the colorscheme
" activation command
colorscheme nord

"=====================================================================
" Settings
"=====================================================================

set number                      " Show line numbers
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set clipboard=unnamedplus      " Use the system clipboard by default
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

" Use tab and shift tab to switch between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


"=====================================================================
" Plugin Specific Mappings and Configuration
"=====================================================================


" fzf
"=====================================================================

" Set ctrl+p to fuzzy file search with fzf similar to VSCode
nnoremap <C-p> :<C-u>FZF<CR>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" NERDTree
"=====================================================================

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


" NerdCommenter
"=====================================================================

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


" vim-gitgutter
"=====================================================================

" Set added line symbol (+) to be green
highlight GitGutterAdd    guifg=#009900 ctermfg=2

" Set changed line symbol (~) to be yellow
highlight GitGutterChange guifg=#bbbb00 ctermfg=3

" Set deleted line symbol (-) to be red
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


" vim-airline
"=====================================================================

" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" Set the path formatter for the filename
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Populate the airline sybmols dictionary with powerline symbols
let g:airline_powerline_fonts = 1


" ack
"=====================================================================

" Use ag, the silver searcher, to do searches with the ack plugin
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Since / is used for text seaching a single file, Leader + /
" seemed like a good option for text searching a directory
nnoremap <Leader>/ :Ack!<Space>
