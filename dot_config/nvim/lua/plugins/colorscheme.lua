return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "catppuccin/nvim",
    opts = {
      color_overrides = {
        latte = {
          base = "#ffffff",
          mantle = "#ffffff",
          text = "#000000",
        },
      },
    },
  },

  -- bug: failed to run config for bufferline.nvim
  -- https://github.com/LazyVim/LazyVim/issues/6355
  {
    "catppuccin/nvim",
    opts = function(_, opts)
      local module = require("catppuccin.groups.integrations.bufferline")
      if module then
        module.get = module.get_theme
      end
      return opts
    end,
  },
}
