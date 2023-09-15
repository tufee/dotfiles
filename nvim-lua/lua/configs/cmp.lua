require("luasnip.loaders.from_vscode").lazy_load()
local lspkind = require("lspkind")

local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local luasnip = require("luasnip")
---@diagnostic disable-next-line: different-requires

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  ---@diagnostic disable-next-line: deprecated
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

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
    ["<C-j>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Esc>"] = cmp.mapping.close(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lsp_signature_help" },
    { name = "copilot" },
    { name = "luasnip" },
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect",
  },
  view = {
    entries = "custom",
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      menu = {
        nvim_lsp = "λ",
        path = "[PATH]",
        buffer = "Ω",
        nvim_lua = "🌙",
        copilot = "🤖",
        luasnip = "🌕",
      },
    }),
  },
})
