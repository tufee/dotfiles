require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, {'i', 's'}),

      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),

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
  { name = 'nvim_lua' },
  { name = 'luasnip' },
  { name = 'cmp_tabnine' },
  { name = 'path' },
  { name = 'buffer', keyword_length = 3 },
  { name = 'treesitter' },
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
          nvim_lsp = "λ",
          nvim_lua = "[NLUA]",
          luasnip = '⋗',
          cmp_tabnine = "[TN]",
          path = "🖫",
          buffer = "Ω",
        }),
    }),
},

  })

