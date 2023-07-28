local wk = require("which-key")

--- Basic keymaps
wk.register({
  ["<leader>"] = {
    s = { ":w<CR>", "Write File" },
    q = { ":q<CR>", "Quit File" },

    w = {
      name = "Operate windows",
      h = { "<C-w>h", "Window 'h'" },
      j = { "<C-w>j", "Window 'j'" },
      k = { "<C-w>k", "Window 'k'" },
      l = { "<C-w>l", "Window 'l'" },
    },

  },

  ["<esc>"] = { ":noh<CR>", "Run :noh" },

  ["<Tab>"] = { ":bn<CR>", "Next buffer" },
  ["<S-Tab>"] = { ":bp<CR>", "Previous buffer" },
})

wk.register({
  ["<leader>"] = {
    --- telescope.nvim
    f = {
      name = "Do searches with telescope.nvim",
      f = { ":Telescope find_files<CR>", "Find files normally" },
      g = { ":Telescope git_files<CR>", "Find files with git" },
    },

    -- nvim-tree.lua
    e = {
      name = "Manage files by nvim-tree.lua",
      f = { ":NvimTreeFocus<CR>", "Focus on file explorer" },
      o = { ":NvimTreeOpen<CR>", "Open file explorer" },
      c = { ":NvimTreeClose<CR>", "Close file explorer" },
    },
  },

  -- flash.nvim
  s = { function() require("flash").jump() end, "Flash jump" },
  S = { function() require("flash").treesitter() end, "Flash treesitter" },
})
