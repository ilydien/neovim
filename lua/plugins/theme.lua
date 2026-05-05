return {
  {
    "jpwol/thorn.nvim",
    enabled = true,
    config = function()
      require("thorn").setup({
        theme = "dark",
        background = "warm",
      })
    end,
  },
}
