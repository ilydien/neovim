return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false, -- ganti true kalau mau background transparan
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },

  -- 2. Beri tahu LazyVim tema default-nya
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa", -- pakai "kanagawa-wave", "kanagawa-dragon", dll. kalau mau
    },
  },
}
