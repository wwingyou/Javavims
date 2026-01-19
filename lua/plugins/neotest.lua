return {
  {
    "rcasia/neotest-java",
    ft = "java",
    tag = "v0.18.6",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap", -- for the debugger
      -- "rcarriga/nvim-dap-ui", -- recommended
      "igorlfs/nvim-dap-view", -- changed
      "theHamsta/nvim-dap-virtual-text", -- recommended
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    keys = {
      {
        '<leader>rT',
        function()
          local neotest = require'neotest'
          neotest.run.run(vim.fn.expand('%'))
          neotest.summary.open()
          neotest.output_panel.open()
        end,
        mode = 'n',
        desc = '[Test] run test file',
      },
      {
        '<leader>rt',
        function() require'neotest'.run.run() end,
        mode = 'n',
        desc = '[Test] run nearest test',
      },
      {
        '<leader>dT',
        function()
          require'jdtls'.test_class()
        end,
        mode = 'n',
        desc = '[Test] debug test file',
      },
      {
        '<leader>dt',
        function() require'jdtls'.test_nearest_method() end,
        mode = 'n',
        desc = '[Test] debug nearest test',
      },
      {
        '<leader>ts',
        function() require'neotest'.summary.toggle() end,
        mode = 'n',
        desc = '[Test] toggle test summary window',
      },
      {
        '<leader>to',
        function() require'neotest'.output_panel.toggle() end,
        mode = 'n',
        desc = '[Test] toggle test output panel',
      },
      {
        '<leader>tc',
        function()
          local neotest = require'neotest'
          neotest.output_panel.clear()
          neotest.summary.close()
        end,
        mode = 'n',
        desc = '[Test] clear neotest windows',
      },
    },
    config = function()
      require'neotest'.setup {
        log_level = vim.log.levels.TRACE,
        adapters = {
          require'neotest-java'({
            java_home = os.getenv("JAVA_HOME"),
          })
        },
        output_panel = {
          open = '10sp'
        },
      }
    end
  },
}
