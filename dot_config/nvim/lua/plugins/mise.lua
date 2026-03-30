if vim.fn.executable("mise") == 1 then
  return {
    {
      "ejrichards/mise.nvim",
      event = "VeryLazy",
      opts = {},
      dependencies = {
        "mason-org/mason.nvim",
      },
    },
  }
else
  return {}
end
