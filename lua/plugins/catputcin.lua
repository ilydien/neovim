return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000, -- ini penting biar dia load duluan
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin", -- ini yang bikin persist
    },
  },
}
