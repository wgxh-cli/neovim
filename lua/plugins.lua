require("lazy").setup({
  -- UI-related plugins
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { 
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = {
      show_current_context = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    build = ":TSUpdate",
    config = function()
      local ts_cfg = require("nvim-treesitter.configs")
      ts_cfg.setup({
        ensure_installed = { "lua", "bash", "rust", "nix", "json" },
        auto_install = true,
        highlight = { enable = true, disable = {} },
        indent = { enable = true, disable = {} },
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local ef = require("everforest")
      ef.setup({})
      ef.load()
    end,
  },
  {
    "rktjmp/lush.nvim",
  },

  -- Features plugins
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      view = {
        adaptive_size = true,
      },
      renderer = {
        root_folder_label = false,
      },
      filters = {
        dotfiles = true,
      }
    },
  },
    event = "VimEnter",
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
        },
        git_files = {
          theme = "ivy",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = require("configs.lspconfig"),
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Editing-related plugins
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_cr = true,
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    event = "InsertEnter",
    config = require("configs.cmp"),
  },
  {
    "simrat39/rust-tools.nvim",
    ft = { "rust" },
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "onsails/lspkind.nvim",
  },
})
