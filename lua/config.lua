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


-- require("bufferline").setup{}

require("gitsigns").setup {
  signs = {
    add          = {hl = 'Green'   , text = '│'},
    change       = {hl = 'Yellow', text = '│'},
    delete       = {hl = 'Red', text = '_'},
    topdelete    = {hl = 'Red', text = '‾'},
    changedelete = {hl = 'Yellow', text = '~'},
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

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vue", "javascript" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}

require'nvim-web-devicons'.setup {
   -- your personnal icons can go here (to override)
   --  -- DevIcon will be appended to `name`
  -- override = {
  --   zsh = {
  --     icon = "",
  --     color = "#428850",
  --     name = "Zsh"
  --   }
  -- };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
