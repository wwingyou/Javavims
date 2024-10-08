vim.bo.tabstop=4
vim.bo.shiftwidth=4

-- Find build tools and set makeprg.
if #vim.fs.find({ 'gradlew' }, {}) > 0 then
  vim.bo.makeprg='./gradlew compileJava'
elseif #vim.fs.find({ 'mvnw' }, {}) > 0 then
  vim.bo.makeprg='./mvnw compile'
end

-- Set fold level 1 by default to show root class.
vim.wo.foldlevel=1

-- Map all lsp method keymaps.
local lsp_utils = require'utils.lsp'
lsp_utils.map_methods(lsp_utils.all_methods())

-- Lsp setup.
local function get_data_dir()
  local data_dir = vim.fn.stdpath('data')
  if type(data_dir) == 'table' then data_dir = data_dir[0] end
  if data_dir == nil then
    data_dir = vim.env.XDG_DATA_HOME or (vim.fn.expand('~/.local/share'))
    data_dir = data_dir .. '/nvim'
  end

  return data_dir
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t');
local jar = get_data_dir() .. '/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar'
local config = get_data_dir() .. '/mason/share/jdtls/config'
local lombok = get_data_dir() .. '/mason/share/jdtls/lombok.jar'
local workspace = get_data_dir() .. '/workspace/' .. project_name

require('jdtls').start_or_attach {
  name = 'jdtls',
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.level=ALL',
    '-javaagent:' .. lombok,
    '-Xmx1G',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', jar,
    '-configuration', config,
    '-data', workspace
  },
  capabilities = lsp_utils.capabilities(),
  root_dir = vim.fs.root(0, { '.git', 'mvnw', 'gradlew' }),
  settings = {
    java = {
      completion = {
        enabled = true,
        importOrder = {
          'java',
          'jakarta',
          'javax',
          'org',
          'com',
          'lombok',
          'groovy'
        }
      }
    }
  }
}

-- Organize imports before buffer write
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Organize imports before buffer write',
  pattern = '*.java',
  group = vim.api.nvim_create_augroup('bufwrite-java', { clear = true }),
  callback = function(_)
    if vim.bo.filetype == 'java' then
      require'jdtls'.organize_imports()
      vim.cmd([[:write]])
    end
  end
})

