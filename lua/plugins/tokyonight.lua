return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night", -- Pilihan: "storm", "moon", "night", "day"
      transparent = false,
      styles = {
        comments = { italic = false }, -- Contoh: matikan italic di komentar
      },
      on_colors = function(colors) end,
      on_highlights = function(highlights, colors) end,
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
