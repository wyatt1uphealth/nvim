require 'vim-options'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'ThePrimeagen/vim-be-good',
  'jiangmiao/auto-pairs',

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  { import = 'wyatt.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>d', function()
  harpoon:list():remove()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<leader>5', function()
  harpoon:list():select(5)
end)
vim.keymap.set('n', '<leader>6', function()
  harpoon:list():select(6)
end)
vim.keymap.set('n', '<leader>7', function()
  harpoon:list():select(7)
end)
vim.keymap.set('n', '<leader>8', function()
  harpoon:list():select(8)
end)
vim.keymap.set('n', '<leader>9', function()
  harpoon:list():select(9)
end)
vim.keymap.set('n', '<leader>-', function()
  harpoon:list():clear()
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local dracula = require 'dracula'
dracula.setup {
  -- customize dracula color palette
  colors = {
    bg = '#282A36',
    fg = '#F8F8F2',
    selection = '#44475A',
    comment = '#6272A4',
    red = '#FF5555',
    orange = '#FFB86C',
    yellow = '#F1FA8C',
    green = '#50fa7b',
    purple = '#BD93F9',
    cyan = '#8BE9FD',
    pink = '#FF79C6',
    bright_red = '#FF6E6E',
    bright_green = '#69FF94',
    bright_yellow = '#FFFFA5',
    bright_blue = '#D6ACFF',
    bright_magenta = '#FF92DF',
    bright_cyan = '#A4FFFF',
    bright_white = '#FFFFFF',
    menu = '#21222C',
    visual = '#3E4452',
    gutter_fg = '#4B5263',
    nontext = '#3B4048',
    white = '#ABB2BF',
    black = '#191A21',
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = '#44475a', -- default nil
  -- set italic comment
  italic_comment = true, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
  -- overrides = function (colors)
  --   return {
  --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
  --   }
  -- end,
}
vim.cmd 'colorscheme dracula'
