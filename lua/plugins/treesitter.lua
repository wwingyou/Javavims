return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    branch = 'master',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        -- install_dir = vim.fn.stdpath('data') .. '/site',
        modules = {},
        ensure_installed = {
          'c',
          'lua',
          'vim',
          'vimdoc',
          'markdown',
          'markdown_inline',
          'java',
          'javascript',
          'typescript',
          'html',
          'rust',
        },
        ignore_install = {},
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          -- additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "M",
            node_incremental = "M",
            scope_incremental = "H",
            node_decremental = "L",
          }
        },
        indent = {
          enable = true
        }
      }

    end
  },
  {
    "rayliwell/tree-sitter-rstml",
    dependencies = { "nvim-treesitter" },
    build = ":TSUpdate",
    config = function ()
      require("tree-sitter-rstml").setup()
    end
  },
  -- Automatic tag closing and renaming (optional but highly recommended)
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
-- return {
--   'nvim-treesitter/nvim-treesitter',
--   tag = 'v0.10.0',
--   build = ':TSUpdate',
--   config = function()
--     require'nvim-treesitter'.setup {
--       modules = {},
--       ensure_installed = {
--         'c',
--         'lua',
--         'vim',
--         'vimdoc',
--         'markdown',
--         'markdown_inline',
--         'java',
--         'javascript',
--         'typescript',
--         'html',
--       },
--       ignore_install = {},
--       auto_install = true,
--       sync_install = false,
--       highlight = {
--         enable = true,
--         -- additional_vim_regex_highlighting = true,
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = "M",
--           node_incremental = "M",
--           scope_incremental = "H",
--           node_decremental = "L",
--         }
--       },
--       indent = {
--         enable = true
--       }
--     }
--
--   end
-- }
