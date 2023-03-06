require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.o.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = {
        nvim_lsp = "λ",
        buffer = "Ω",
        path = "[PATH]",
        nvim_lua = "🌙",
        luasnip = "🌕",
        --    copilot = "🤖",
      },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4), 
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.insert,
      select = false,
    }),

    
 ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
      -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 3 },
    { name = "path"},
    { name = "nvim_lua" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    --  { name = "copilot" },
  },
})
