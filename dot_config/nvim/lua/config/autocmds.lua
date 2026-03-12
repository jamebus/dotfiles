-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup_autoformat = vim.api.nvim_create_augroup("autoformat", { clear = true })
local augroup_commentstring = vim.api.nvim_create_augroup("commentstring", { clear = true })
local augroup_termrequest = vim.api.nvim_create_augroup("termrequest", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "terraform", "terraform-vars", "tf" },
  group = augroup_autoformat,
  desc = "Turn on autoformat",
  callback = function()
    vim.b.autoformat = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "puppet",
  group = augroup_commentstring,
  desc = "Set commentstring",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})

vim.api.nvim_create_autocmd("TermRequest", {
  group = augroup_termrequest,
  desc = "Pass through OSC 133 to terminal",
  callback = function()
    local request = vim.v.termrequest
    if request:find("]133;") then
      io.write(request)
      io.flush()
    end
  end,
})
