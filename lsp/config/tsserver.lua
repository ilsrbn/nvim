return {
  lsp = {
    config = {
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "tsconfig.json"
        return opts
      end,
    },
    setup_handlers = {
      -- add custom handler
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
    },
  },
  plugins = {
    "jose-elias-alvarez/typescript.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        -- ensure_installed = { "tsserver" }, -- automatically install lsp
        handlers = {
          tsserver = function()
            require("null-ls").register(require("null-ls").builtins.diagnostics.tsserver.with {
              condition = function(utils) return utils.root_has_file "tsconfig.json" end,
            })
          end,
        },
      },
    },
  },
}
