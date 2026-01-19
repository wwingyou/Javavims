-- Always indent with 3 space.
vim.opt.expandtab=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2

-- Always use the same register with external clipboard.
vim.opt.clipboard:append 'unnamedplus'

-- Alawys save current file before to move to other file.
vim.opt.autowrite=true

-- Show informatic extra columns.
vim.opt.number=true
vim.opt.relativenumber=true
-- vim.opt.foldcolumn='2'

-- NOTE: This options makes it automatically opens and closes current cursor
-- position. It's pretty fun but very confusing as for daily option.
-- Maybe used for later?
-- vim.opt.foldopen='all'
-- vim.opt.foldclose='all'

-- Fold options.
-- NOTE: Folding is disabled by default.
vim.opt.foldtext=''
vim.wo.foldmethod='expr'
vim.wo.foldexpr='v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel=999

-- Line break options.
vim.opt.wrap=true
vim.opt.linebreak=true
vim.opt.breakindent=true
vim.opt.showbreak='~'
vim.opt.breakindentopt='sbr,shift:2'

-- Ask to save when leaving buffer without saving.
vim.opt.confirm=true

-- Highlight cursor column and line. 
-- vim.opt.cursorcolumn=true
vim.opt.cursorline=true
vim.opt.cursorlineopt='both'

-- Always add 'g' flag for substitution.
vim.opt.gdefault=true

-- Use smartcase search.
vim.opt.ignorecase=true
vim.opt.smartcase=true

-- Set list mode by default.
vim.opt.list=true

-- Scroll options.
vim.opt.scrolloff=10

-- Split options.
vim.opt.splitright=true
vim.opt.splitbelow=true

-- Move cursor at the first non-blank character of the line. Useful maybe?
vim.opt.startofline=true

-- Set popup menu height.
vim.opt.pumheight=20

-- Show only one status line at the bottom
-- vim.opt.laststatus=3

-- NOTE: This autocmd is for a force option updates.
-- Bug fix for 'mouse' option is not set in normal way.
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Force update options',
  callback = function ()
    -- Use mouse support in normal mode.
    vim.opt.mouse='n'
  end,
  once = true
})

-- Switch.vim global definitions
vim.g.switch_definitions = {
  -- { 'a', 'b', 'c' },
};

-- Reduce updatetime to open up diagnostic faster
vim.opt.updatetime=1000

vim.opt.splitbelow=true
vim.opt.equalalways=false
