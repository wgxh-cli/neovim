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
      lsp = { override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    event = "UiEnter",
    config = function()
      require("heirline").setup({})
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = function()
      require("ibl").setup{}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter", "folke/which-key.nvim" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    event = "BufEnter",
    build = ":TSUpdate",
    config = function()
      local ts_cfg = require("nvim-treesitter.configs")
      ts_cfg.setup({
        ensure_installed = { "lua", "bash", "rust", "nix", "json" },
        auto_install = true,
        highlight = { enable = true, disable = {} },
        indent = { enable = true, disable = {} },
        autotag = { enable = true, },
        textobjects = {
        },
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    --lazy = false,
    --priority = 1000,
    --config = function()
    --  local ef = require("everforest")
    --  ef.setup({})
    --  ef.load()
    --end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function ()
      require("catppuccin").setup({
        flavor = "mocha",
      })
      vim.cmd("colorscheme catppuccin")
    end
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
      },
      git = {
        enable = false,
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
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
        opts = {},
      },
      {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
      },
    },
    lazy = true,
    config = function()
      local lsp = require("lspconfig")
      local api = vim.api

      lsp.volar.setup {
        filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
      }
      lsp.tailwindcss.setup {}
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        rainbow = {
          enabled = true,
        },
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {},
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the confieuration section below
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {}
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
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        dependencies = {
          "rafamadriz/friendly-snippets",
        }
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    config = require("configs.cmp"),
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "mhartington/formatter.nvim",
    config = function()
      local util = require "formatter.util"
      require("formatter").setup {}
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require("configs.neorg"),
  },
})
