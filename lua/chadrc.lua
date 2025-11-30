-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   virtual_text = false,
-- })

M.base46 = {
  theme = "material-darker",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                        _____       .__     __                                      ",
    "    ____ _____   __ ___/ ____\\____  |  |   |  | ____ __  ________ __  _____   ____  ",
    "   /    \\\\__  \\ |  |  \\   __\\\\__  \\ |  |   |  |/ /  |  \\/  ___/  |  \\/     \\ /  _ \\ ",
    "  |   |  \\/ __ \\|  |  /|  |   / __ \\|  |__ |    <|  |  /\\___ \\|  |  /  Y Y  (  <_> )",
    "  |___|  (____  /____/ |__|  (____  /____/ |__|_ \\____//____  >____/|__|_|  /\\____/ ",
    "       \\/     \\/                  \\/            \\/          \\/            \\/        ",
    " .................................................. ",
    " ............................ ",
  },
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "default",

    modules = {
      -- Your custom git module (keep it if you have it)

      lsp_status = function()
        -- Using the new API (Neovim 0.10+)
        local clients = vim.lsp.get_clients { bufnr = 0 } -- 0 means current buffer

        if #clients > 0 then
          local names = {}
          for _, client in ipairs(clients) do
            -- Filter out boring clients like "null-ls" or "copilot" if you want
            -- For now, let's just show them all or just the first one
            table.insert(names, client.name)
          end

          -- Join names if you have multiple (e.g., "pyright, null-ls")
          local status_text = table.concat(names, ", ")

          -- Return the formatted string with icon
          return "%#St_LspStatus#" .. "   " .. status_text .. " "
        end

        return "" -- Show nothing if no LSP attached
      end,
    },

    order = { "mode", "file", "git", "%=", "lsp_status", "diagnostics", "cursor", "cwd" },
  },
  tabufline = {
    lazyload = false,
  },
}

return M
