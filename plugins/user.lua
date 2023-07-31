return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    config = function() require("kanagawa").setup {} end,
  },
  "heavenshell/vim-jsdoc",
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
    event = "User AstroFile",
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = "User AstroFile",
  },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
}
