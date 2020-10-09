call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim' 

call plug#end()

" #################### Theme ####################
set background=dark
let g:gruvbox_italic=1
set termguicolors
autocmd vimenter * colorscheme gruvbox

set relativenumber

" #################### NERDTree ####################

" open NERDTree on startup if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree on startup if a directory was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map to open NERDTree with a specific key
map <C-n> :NERDTreeToggle<CR>

" close vim if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" #################### Fuzzy Finder ####################

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" let g:fzf_layout = { 'down': '~40%' }

nmap <silent> sf :FzfFiles<cr>


" errors
" FZF breaks, trying to open a new window
" e.g. :Files
" probably to do with bash missing in path
" https://github.com/junegunn/fzf.vim/issues/703
