return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        puppet = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "puppet" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        puppet = { "puppet-lint" },
      },
      linters = {
        ["puppet-lint"] = {
          cmd = vim.fn.stdpath("data")
            .. "/mason/packages/puppet-editor-services/libexec/vendor/puppet-lint/bin/puppet-lint",
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        puppet = { "puppet-lint" },
      },
      formatters = {
        ["puppet-lint"] = {
          command = vim.fn.stdpath("data")
            .. "/mason/packages/puppet-editor-services/libexec/vendor/puppet-lint/bin/puppet-lint",
        },
      },
    },
  },
}
