return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- -- Set a formatter
      -- -- null_ls.builtins.formatting.stylua,
      -- -- null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file ".eslintrc.json"
              or utils.root_has_file ".eslintrc.js"
        end,

      }),

      null_ls.builtins.formatting.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file ".eslintrc.json"
              or utils.root_has_file ".eslintrc.js"
        end,
      }),

      -- Set eslint_d as default code actions

      null_ls.builtins.code_actions.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file ".eslintrc.json"
              or utils.root_has_file ".eslintrc.js"
        end,
      })
    }
    return config -- return final config table
  end,
}
