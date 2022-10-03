local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
      lua = {'string'},
      javascript = true
    }
  })

local ts_conds = require('nvim-autopairs.ts-conds')

npairs.add_rules({
    Rule("%", "%", "lua")
      :with_pair(ts_conds.is_ts_node({'string','comment'})),
    Rule("$", "$", "lua")
      :with_pair(ts_conds.is_not_ts_node({'function'})),
    Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
      :use_regex(true)
      :set_end_pair_length(2),
  })
