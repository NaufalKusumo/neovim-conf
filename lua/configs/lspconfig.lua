local configs = require "nvchad.configs.lspconfig"
local defaults = configs.defaults()
local lspconfig = require "lspconfig"

-- 1. Remove "pylsp" from this list
local servers = { "html", "cssls" }

-- 2. Setup standard servers with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = configs.on_attach,
    on_init = configs.on_init,
    capabilities = configs.capabilities,
  }
end

-- 3. Setup pylsp SEPARATELY with the ignore rule
lspconfig.pylsp.setup {
  on_attach = configs.on_attach,
  on_init = configs.on_init,
  capabilities = configs.capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501" },
          maxLineLength = 120,
        },
      },
    },
  },
}
