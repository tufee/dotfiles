local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.insert,
          select = false,
        },
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Esc>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(), 
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
      }),
    sources = {
      { name = 'nvim_lsp' }, 
      { name = 'luasnip' }, 
      { name = 'nvim_lua' },
      { name = 'path' }, 
      { name = 'buffer', keyword_length = 4 },
      { name = 'treesitter' },
      { name = 'cmp_tabnine' },
      { name = 'nvim_lsp_signature_help' }
    },
    completion = {
      keyword_length = 1,
      completeopt = "menu,noselect"
    },
    view = {
      entries = 'custom',
    },
    formatting = {
      format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = ({
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              cmp_tabnine = "[TN]",
              nvim_lua = "[Lua]",
              path = "[Path]",
              buffer = "[Buffer]",
            }),
        }),
    },

  })

