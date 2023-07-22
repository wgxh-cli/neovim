local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting;
--local lint = null_ls.builtins.diagnostics;

local sources = {
  formatting.rustfmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
