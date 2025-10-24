return {
  "xvzc/chezmoi.nvim",
  opts = {
    edit = {
      -- https://www.chezmoi.io/reference/special-files/
      -- https://www.chezmoi.io/reference/special-directories/
      -- https://www.chezmoi.io/reference/source-state-attributes/
      ignore_patterns = {
        "%.chezmoi%.[^%.]+%.tmpl",
        "%.chezmoidata.*",
        "%.chezmoiexternal.*",
        "%.chezmoiignore",
        "%.chezmoiremove",
        "%.chezmoiroot",
        "%.chezmoiversion",
        -- Directories not supported. Matching on filename only.
        -- "/%.chezmoidata/",
        -- "/%.chezmoiexternals/",
        -- "/%.chezmoiscripts/",
        -- "/%.chezmoitemplates/",
        "run_.*",
      },
    },
  },
}
