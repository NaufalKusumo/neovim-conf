return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.chunk"
      -- require("hlchunk").setup({})
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require "configs.inline-diagnostics"
      vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics
    end,
  },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    cmd = "TimerlyToggle",
    opts = {}, -- optional
  },

  {
    "gisketch/triforce.nvim",
    dependencies = { "nvzone/volt" },
    config = function()
      require "configs.triforce"
    end,
  },

  -- Lua
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
    config = function()
      require "configs.persisted"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
        opts = {},
      },
    },
    opts = function(_, opts)
      opts.sources[1].trigger_chars = { "-" }
      table.insert(opts.sources, 1, { name = "supermaven" })
    end,
  },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
