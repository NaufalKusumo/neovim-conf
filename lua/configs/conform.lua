local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_fix" },
    
    typescript = { "prettier" },
    javascript = { "prettier" },
    typescriptreact = { "prettier" },
    
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

return options
