call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuttie/comfortable-motion.vim'
"Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-syntastic/syntastic'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'tmux-plugins/vim-tmux'
" Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" #################### README ####################

" Installation
" sudo apt install fzf
" sudo apt install tmux
" sudo apt install eslint
 
" .eslintrc.js => to lint Vue.js and JS
"
" Synchronize clipboard in WSL with win32yank.exe
" curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
" sudo apt install unzip
" unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
" chmod +x /tmp/win32yank.exe
" sudo mv /tmp/win32yank.exe /usr/local/bin/

" Potential plugins
" https://github.com/prettier/vim-prettier

" #################### General ####################

set relativenumber
set scrolloff=999       " always keep cursor at the middle of screen
set virtualedit=onemore " allow the cursor to move just past the end of the line
set undolevels=5000     " set maximum undo levels
set foldmethod=manual       " use manual folding
set diffopt=filler,vertical " default behavior for diff
"set nowrap        " disable wrap for long lines
"set textwidth=0   " disable auto break long lines
" ====================================================================
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" ====================================================================
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
" ====================================================================
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows/61864749#61864749
set clipboard=unnamedplus " use with neovim to sync system clipboard

" #################### Theme ####################

set background=dark
let g:gruvbox_italic=1
set termguicolors
autocmd vimenter * colorscheme gruvbox

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

" #################### NERDCommenter ####################

:map <C-a> <plug>NERDCommenterToggle

" #################### Fuzzy Finder ####################

nnoremap <c-p> :Files<cr>
" nmap <silent> sf :FzfFiles<cr>

" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" let g:fzf_layout = { 'down': '~40%' }

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
augroup fzf
	  autocmd!
	    autocmd! FileType fzf
	      autocmd  FileType fzf set laststatus=0 noshowmode noruler
	          \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
      augroup END

" #################### ALE ####################

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
 "In ~/.vim/vimrc, or somewhere similar.
 let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
 let g:ale_linters = {'vue': ['eslint', 'vls']}

" #################### Miscellaneous mapping ####################

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Rebind save to ctrl-s, allow saving in insert
inoremap <C-S> <Esc>:update<cr>gi

" WSL yank support
"let s:clip = '/mnt/c/Windows/System32/clip.exe'  " default location
"if executable(s:clip)
    "augroup WSLYank
            "autocmd!
                    "autocmd TextYankPost * call system(s:clip, join(v:event.regcontents, "\<CR>"))
                        "augroup END
                        "end
                       
" #################### Smooth scroll ####################

" #################### Syntastic ####################

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""let g:syntastic_vuejs_checkers = ['syntastic-vue-eslint']
"" Vue.js
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exec = $HOME . '/.vim/plugged/syntastic/syntax_checkers/vue/eslint.vim'
""let g:syntastic_javascript_eslint_exec = 'eslint_d'
"" PHP
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
