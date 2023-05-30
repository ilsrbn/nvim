return {
  lsp = {
    setup_handlers = {
      -- add custom handler
      rust_analyzer = function(_, opts)
        require('lspconfig').rust_analyzer.setup {
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                  'cargo', 'clippy', '--workspace', '--message-format=json',
                  '--all-targets', '--all-features'
                }
              }
            }
          }
        }

        require("rust-tools").setup { server = opts }
      end
    },
  },
  plugins = {
    "simrat39/rust-tools.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer" },
      },
    },
  },
}
