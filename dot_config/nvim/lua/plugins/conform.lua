return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      -- https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd
      shfmt = {
        args = { "-kp" },
      },
    },
  },
}
