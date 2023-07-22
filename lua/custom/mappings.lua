local mappings = {}

mappings.windows = {
  n = {
    ["<leader>wh"] = { "<C-w>h", "Window left" },
    ["<leader>wj"] = { "<C-w>j", "Window Down" },
    ["<leader>wk"] = { "<C-w>k", "Window Up" },
    ["<leader>wl"] = { "<C-w>l", "Window Right" },
  }
}

mappings.nvimtree = {
  n = {
    ["<leader>eo"] = { "<cmd>NvimTreeOpen<CR>", "Open file explorer" },
    ["<leader>ec"] = { "<cmd>NvimTreeClose<CR>", "Close file explorer" },
    ["<leader>ef"] = { "<cmd>NvimTreeFocus<CR>", "Focus on the file explorer" },
  }
}

mappings.basics = {
  n = {
    ["<leader>s"] = { "<cmd>w<CR>", "Write File" },
    ["<leader>q"] = { "<cmd>q<CR>", "Quit file" },
  }
}

return mappings
