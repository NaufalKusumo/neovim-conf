local configs = require "nvchad.configs.lspconfig"
configs.defaults()

local servers = { "html", "cssls", "vtsls", "pyright" }
-- Just in case if you want to change from pyright, use pylsp, since pylsp is better on code documentation
--
-- 2. Setup standard servers with default config
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = configs.capabilities,
  })
end

vim.lsp.enable(servers)

-- ruff LSP
vim.lsp.config("ruff", {
  capabilities = configs.capabilities,
})

vim.lsp.enable("ruff")
