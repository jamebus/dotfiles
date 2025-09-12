-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.list = true
vim.opt.listchars = {
  eol = "¬",
  tab = ">-",
  lead = "·",
  trail = "·",
  multispace = "·",
  extends = "▶",
  precedes = "◀",
  nbsp = "‿",
}

vim.opt.fillchars:append({ eob = "~" })

vim.g.autoformat = false

vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
