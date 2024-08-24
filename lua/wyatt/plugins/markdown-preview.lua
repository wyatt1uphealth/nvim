return {
  -- Install markdown preview, use npx if available.
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  config = function()
    vim.cmd [[
      let g:mkdp_auto_start=0
      let g:mkdp_auto_close=0
      let g:mkdp_refresh_slow=0
      let g:mkdp_markdown_css = expand("~/.config/nvim/markdown/github-markdown.css")
      let g:mkdp_browser = 'Arc'
    ]]
  end,
  build = function(plugin)
    if vim.fn.executable 'npx' then
      vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn['mkdp#util#install']()
    end
  end,
  init = function()
    if vim.fn.executable 'npx' then
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  end,
}
