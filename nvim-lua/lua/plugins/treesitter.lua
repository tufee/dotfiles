require('nvim-treesitter.configs').setup{
  highlight = { enable = true },
  indent = { enable = true },
  ensure_installed = {
      'bash',
      'javascript',
      'json',
      'lua',
      'typescript',
      'tsx',
      'css',
      'yaml',
      'dockerfile',
      'html',
      'dot',
      'http',
      'markdown',
      'regex',
      'scss',
  }
}
