return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  -- custom plugins
  {
    "neovim/nvim-lspconfig",
     config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "configs.lspconfig"
     end,
  }
  ,
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup {}
    end,
    event = "BufEnter",
  },
  -- {
  --   "mfussenegger/nvim-jdtls",
  --   enabled = false,
  -- config = function()
  --   require("jdtls").start_or_attach {
  --     cmd = { "$HOME/softs/jdt-language-server/bin/jdtls" },
  --     root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  --   }
  -- end,
  -- },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {}
    end,
    event = "BufEnter",
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
    lazy = false,
  }
}
