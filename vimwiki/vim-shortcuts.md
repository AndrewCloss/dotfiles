= Navigation =

gt            go to next tab
gT            go to previous tab
{i}gt         go to tab in position i


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

ctrl - s - save
  
  
  

| shortcut | additional | meaning                        |
|----------|------------|--------------------------------|
| ctrl - p |            | open fuzzy finder (gitignored) |
| ctrl - c |            | toggle comment                 |
| ctrl - a |            | tmux prefix                    |
| \/       | c          | new tmux window                |
| \/       | #          | switch to tmux window          |
|          |            |                                |
