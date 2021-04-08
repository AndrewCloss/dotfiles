" Plugins
" =============================================================================

call plug#begin('~/.config/nvim/plugged')
" themes
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'crusoexia/vim-monokai'
Plug 'jsit/toast.vim/'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'pineapplegiant/spaceduck'
Plug 'aonemd/kuroi.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
" Plug 'mhinz/vim-signify'
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
" Plug 'wfxr/minimap.vim'
Plug 'junegunn/goyo.vim'
Plug 'kassio/neoterm'
Plug 'liuchengxu/vista.vim'
" navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" General
" =============================================================================
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["▸ ", ""]
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

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
highlight clear CursorLineNR " erase line number color

" Keybindings
" =============================================================================
let mapleader = " " " space as leader key
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>f :Prettier<CR>
nnoremap <leader>m :Goyo<CR>

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

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

let g:goyo_width=120

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

" status bar
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline                                            
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab                                                    
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right                                                           
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline                                                 
" let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline                                  
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline               
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers                                                              
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
" let g:airline_detect_spelllang=0
" let g:airline_detect_spell=0
let g:airline_extensions = ['coc', 'fugitiveline', 'branch', 'term', 'tabline']
let g:airline_powerline_fonts = 1
" let g:airline_section_z = '%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#:%v'
" let g:airline_section_z = airline#section#create(['linenr'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" let g:airline#extensions#tabline#left_sep = ''

" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = '|'
" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE

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

" #################### COC ####################

" TextEdit might fail if hidden is not set.

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

" highlight clear SignColumn
" autocmd ColorScheme * highlight! link SignColumn LineNr

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
