require('nvim-tree').setup{
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  filters = {
    custom = {'.cache'},
    exclude = { '.env', 'node_modules'}
  },
} 
