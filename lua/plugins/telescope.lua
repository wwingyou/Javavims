return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope-ui-select.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release',
    }
  },
  config = function()
    require'telescope'.setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          vertical = { preview_height = 0.75 }
        },
        file_ignore_patterns = { 'bin/', '%.class' },
        -- file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        -- generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
      },
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      },
      -- file_ignore_patterns = { "%.class" }
    }
    require'telescope'.load_extension('ui-select')
    require'telescope'.load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end, { desc = '[Telescope] find files' })
    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end, { desc = '[Telescope] live grep' })
    vim.keymap.set('n', '<leader>fb', function() builtin.buffers() end, { desc = '[Telescope] buffers' })
    vim.keymap.set('n', '<leader>fh', function() builtin.help_tags() end, { desc = '[Telescope] help tags' })
    vim.keymap.set('n', '<leader>fr', function() builtin.oldfiles() end, { desc = '[Telescope] old files' })
  end
}
