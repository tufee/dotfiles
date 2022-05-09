require('nvim-treesitter.configs').setup{
 
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
      'prisma'
  },
  highlight = { enable = true },
  indent = { enable = true }, 
}
