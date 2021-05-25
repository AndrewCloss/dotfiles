        -- let g:indent_blankline_use_treesitter = v:true
        -- let g:indent_blankline_indent_level = 4
        -- g.indent_blankline_show_first_indent_level = v:false
-- g.indent_blankline_char = "P"

-- nvim-telescope/telescope.nvim
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


require("bufferline").setup{}

require("gitsigns").setup {
  signs = {
    add          = {hl = 'GruvboxGreen'   , text = '│'},
    change       = {hl = 'GruvboxYellow', text = '│'},
    delete       = {hl = 'GruvboxRed', text = '_'},
    topdelete    = {hl = 'GruvboxRed', text = '‾'},
    changedelete = {hl = 'GruvboxYellow', text = '~'},
  },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    watch_index = {
        interval = 100
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}

