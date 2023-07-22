local plugins = {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function ()
          require "custom.configs.null-ls"
        end,
      },
      {
        "simrat39/rust-tools.nvim",
        config = function ()
          require "custom.configs.rust-tools"
        end
      }
    },
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "rust", "lua", "bash" },
    },
  },
}

return plugins
