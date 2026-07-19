return {
  {
    {
      "mfussenegger/nvim-lint",
      opts = {
        linters_by_ft = {
          markdown = {},
        },
      },
    },
    {
      "stevearc/conform.nvim",
      opts = {
        formatters_by_ft = {
          markdown = { "markdown-toc" },
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          rumdl = {
            root_markers = { ".git", ".rumdl.toml" },
          },
        },
      },
    },
  },
}
