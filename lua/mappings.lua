require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.keymap.set("n", "<C-l>", function()
  require("triforce").show_profile()
end, { desc = "Display Triforce's stat" })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})

vim.keymap.set("n", "<leader>rr", function()
  vim.cmd "w" -- Save file

  local file_dir = vim.fn.expand "%:p:h"
  local file_path = vim.fn.expand "%:p"

  require("nvchad.term").runner {
    id = "python_runner",
    pos = "sp",
    cmd = "cd '" .. file_dir .. "' && python3 '" .. file_path .. "'",
  }
end, { desc = "Run Python on current directory" })

-- Normal mode mapping for terminal buffer
vim.keymap.set("t", "<A-h>", function()
  vim.cmd "hide" -- Hides the current terminal window
end, { desc = "Hide Terminal" })
