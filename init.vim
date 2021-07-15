" Plugins
" =============================================================================
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/nvim/plugged')
" themes
Plug 'sainnhe/gruvbox-material'
" Plug 'ghifarit53/tokyonight-vim'
" navigation
Plug 'justinmk/vim-sneak'
Plug 'psliwka/vim-smoothie'
Plug 'reedes/vim-wheel'
Plug 'rbgrouleff/bclose.vim' " whats this for
Plug 'francoiscabrol/ranger.vim'
" autocomplete, linting
" git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
" languages
" Plug 'storyn26383/vim-vue'
" Plug 'leafOfTree/vim-vue-plugin'
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
Plug 'liuchengxu/vista.vim'
" navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'itchyny/lightline.vim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" =============================================================================
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'akinsho/nvim-bufferline.lua'
call plug#end()

" General
" =============================================================================

set termguicolors
lua require('config')

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

nmap ]r :!npm run repl %:p<cr>
nmap ]t :!npm run lint %:p<cr>
nmap ]y :!npm run test %:p<cr>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

let mapleader = " " " space as leader key
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>f :Prettier<CR>

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" mhinz/vim-startify
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1


" gruvbox-community/gruvbox
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 1

" colorscheme tokyonight
" let g:gruvbox_contrast_dark = 'hard'
if ('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors                   " 24-bit colors
end
" let g:gruvbox_invert_selection='0'
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_enable_bold = 0
<
" let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
" set background=dark
highlight clear SignColumn

hi CocErrorSign  ctermfg=Red guifg=#ff0000 guibg=none
hi CocWarningSign  ctermfg=Brown guifg=#ff922b guibg=none
hi CocInfoSign  ctermfg=Yellow guifg=#fab005 guibg=none

" let g:vim_vue_plugin_load_full_syntax = 1
" let g:vim_vue_plugin_highlight_vue_attr = 1
" let g:vim_vue_plugin_highlight_vue_keyword = 1

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

" francoiscabrol/ranger.vim
let g:ranger_map_keys = 0
map <leader>p :RangerCurrentFileExistingOrNewTab<CR>
let g:ranger_replace_netrw = 1

" Yggdroot/indentLine, lukas-reineke/indent-blankline.nvim
" let g:indentLine_char = '|'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" nvim-telescope/telescope.nvim


" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
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


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

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
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-phpls', 'coc-vetur', 'coc-eslint']
