require('nvim-tree').setup{
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  filters = {
    custom = {'.git', 'node_modules', '.cache'},
    exclude = { '.env' }
  },
}  
