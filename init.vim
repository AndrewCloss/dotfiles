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
Plug 'jwalton512/vim-blade'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'tmux-plugins/vim-tmux'
" Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dispatch'             "| Optional
Plug 'tpope/vim-projectionist'        "|
Plug 'noahfrederick/vim-composer'     "|
Plug 'noahfrederick/vim-laravel'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

call plug#end()

" #################### README ####################

" Installation
" sudo apt install fzf
" sudo apt install tmux
 
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
set undofile            " preserves undo history per file, through closing and opening
set spell               " spell checking
set foldmethod=manual       " use manual folding
set diffopt=filler,vertical " default behavior for diff
"set nowrap        " disable wrap for long lines
"set textwidth=0   " disable auto break long lines
set hlsearch incsearch " turns on highlighting search results and searching as you type.
"set lazyredraw " performance?
set linebreak showbreak=↪\  " all of this just tweaks how lines are shown when they wrap.
"set linebreak showbreak=↪\ breakindent breakindentopt=shift:-2 " all of this just tweaks how lines are shown when they wrap.
set formatoptions+=nj
let g:PHP_outdentphpescape = 0 " means that PHP tags will match the indent of the HTML around them
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
"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Change cursor shape based on mode
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"
" ====================================================================
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows/61864749#61864749
set clipboard=unnamedplus " use with neovim to sync system clipboard

" #################### Theme ####################

set background=dark
let g:gruvbox_italic=1
set termguicolors
autocmd vimenter * colorscheme gruvbox
let g:airline_theme = 'bubblegum'

let g:airline#extensions#disable_rtp_load = 1

let g:airline_detect_spelllang=0
let g:airline_detect_spell=0
let g:airline_extensions = ['tmuxline']
let g:airline_powerline_fonts = 1
" #################### NERDTree ####################

" open NERDTree on startup if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open NERDTree on startup if a directory was specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map to open NERDTree with a specific key
map <C-n> :NERDTreeToggle<CR>

" close vim if only NERDTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" #################### NERDCommenter ####################

:map <C-c> <plug>NERDCommenterToggle

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
"augroup fzf
		"autocmd!
			"autocmd! FileType fzf
				"autocmd  FileType fzf set laststatus=0 noshowmode noruler
						"\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
      "augroup END

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


" #################### COC ####################

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

" #################### ALE ####################

" In ~/.vim/vimrc, or somewhere similar.
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\   'javascript': ['eslint'],
"\}
 ""In ~/.vim/vimrc, or somewhere similar.
 "let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
 "let g:ale_linters = {'vue': ['eslint', 'vls']}

