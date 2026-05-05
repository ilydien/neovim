return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    opts.window = {
      completion = {
        border = "rounded",
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
      },
      documentation = {
        border = "rounded",
      },
    }
  end,
}
