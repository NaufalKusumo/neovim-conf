local configs = require "nvchad.configs.lspconfig"
local defaults = configs.defaults()
local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "vtsls", "pyright" }
-- Just in case if you want to change from pyright, use pylsp, since pylsp is better on code documentation
--
-- 2. Setup standard servers with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = configs.on_attach,
    on_init = configs.on_init,
    capabilities = configs.capabilities,
  }
end

-- ruff LSP
lspconfig.ruff.setup {
  on_attach = configs.on_attach,
  capabilities = configs.capabilities,
}
