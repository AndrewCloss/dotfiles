" Plugins
" =============================================================================

call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
" themes
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'crusoexia/vim-monokai'
Plug 'jsit/toast.vim/'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'pineapplegiant/spaceduck'
Plug 'aonemd/kuroi.vim'
Plug 'joshdick/onedark.vim'
" navigation
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
Plug 'reedes/vim-wheel'
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" autocomplete, linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" languages
" Plug 'storyn26383/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'noahfrederick/vim-composer'     
Plug 'noahfrederick/vim-laravel'
Plug 'jwalton512/vim-blade'
" other
" Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-dispatch'             
Plug 'tpope/vim-projectionist'        
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-surround'
" Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'aonemd/kuroi.vim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'senran101604/neotrix.vim'
Plug 'mhinz/vim-startify'
Plug 'kassio/neoterm'
Plug 'liuchengxu/vista.vim'
" navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
call plug#end()

" General
" =============================================================================

set nofixendofline
set relativenumber
set nu rnu                      " hybrid line numbers
set scrolloff=5                 " always display 5 lines around cursor
set undolevels=5000             " set maximum undo levels
set undofile                    " preserves undo history per file, through closing and opening
" set spell                     " spell checking
set diffopt=filler,vertical     " default behavior for diff
" set nowrap                     " disable wrap for long lines
"set textwidth=0                " disable auto break long lines
set hlsearch incsearch          " turns on highlighting search results and searching as you type.
set linebreak showbreak=⏎\      " all of this just tweaks how lines are shown when they wrap.
set formatoptions+=nj
" let g:PHP_outdentphpescape = 0  " means that PHP tags will match the indent of the HTML around them
" tabs
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
" search
set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on
" clipboard
set clipboard=unnamedplus " use with neovim to sync system clipboard
" fold manually by indent level
" set foldmethod=indent   
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2
set ttimeoutlen=10
set cursorline
set hidden
set cmdheight=1
set noshowmode noruler
set laststatus=2
" highlight clear CursorLineNR " erase line number color

" =============================================================================
" Keybindings
" =============================================================================

let mapleader = " " " space as leader key
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>f :Prettier<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" liuchengxu/vista.vim
" let g:vista#renderer#enable_icon = 1
" let g:vista_icon_indent = ["▸ ", ""]
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 0
let g:neoterm_keep_term_open = 0
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" mhinz/vim-startify
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

set termguicolors                   " 24-bit colors

" gruvbox-community/gruvbox
let g:gruvbox_contrast_dark = 'hard'
if ('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
end
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1

" #################### Miscellaneous mapping ####################
" Use ctrl-[hjkl] to select the active split!
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Rebind save to ctrl-s, allow saving in insert and visual
" noremap <C-S> :update<cr>
" vnoremap <C-S> <C-C>:update<CR>
" inoremap <C-S> <Esc>:update<cr>gi


" if !empty($TMUX)
    " au BufEnter * :OneStatus
" endif
" autocmd BufRead,BufNewFile *.vue setfiletype html

" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Erase gutter color, set sign background and foregrounds
highlight! link SignColumn LineNr
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#b8bb26 ctermfg=2
highlight GitGutterChange guifg=#fabd2f ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" nvim-telescope/telescope.nvim
lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
EOF

" francoiscabrol/ranger.vim
let g:ranger_map_keys = 0
map <leader>p :RangerCurrentFileExistingOrNewTab<CR>
let g:ranger_replace_netrw = 1

" Yggdroot/indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }




" nvim-lspconfig
lua << EOF
require'lspconfig'.vuels.setup{}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.jsonls.setup{}
EOF




