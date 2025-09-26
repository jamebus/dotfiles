return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show hidden files
            ignored = true, -- show files ignored by .gitignore
          },
          files = {
            hidden = true, -- show hidden files
            ignored = true, -- show files ignored by .gitignore
          },
        },
      },
    },
  },
}
