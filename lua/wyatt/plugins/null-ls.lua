return {
  'jose-elias-alvarez/null-ls.nvim',
  ft = { 'python' },
  opts = function()
    local null_ls = require 'null-ls'
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    return {
      sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.black,
      },
    }
  end,
}
