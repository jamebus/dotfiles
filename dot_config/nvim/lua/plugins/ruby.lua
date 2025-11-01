return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ruby = { "reek" },
    },
    linters = {
      reek = {
        cmd = "reek",
        stdin = true,
        args = {
          "--format",
          "json",
          "--force-exclusion",
          "--stdin-filename",
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local decoded = vim.json.decode(output)

          for _, smell in ipairs(decoded or {}) do
            for _, line in ipairs(smell.lines) do
              table.insert(diagnostics, {
                source = "reek",
                lnum = line - 1,
                col = 0,
                severity = vim.diagnostic.severity.WARN,
                message = smell.message,
                code = smell.smell_type,
              })
            end
          end

          return diagnostics
        end,
      },
    },
  },
}
