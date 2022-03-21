require('nvim-tree').setup{
  auto_close = true,
  filters = {
    custom = {'.git', 'node_modules', '.cache'}
  },
  actions = {
    open_file = {
      quit_on_open = true
    }
  }
}
