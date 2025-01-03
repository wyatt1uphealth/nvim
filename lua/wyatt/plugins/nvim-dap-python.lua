return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function(_, opts)
    local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
    local dap_python = require('dap-python')
    dap_python.setup(path)


  end,
}
