return {
  {
    "folke/snacks.nvim",
    opts = {
      -- file explorer dinonaktifkan, diganti neo-tree (lihat neotree.lua)
      explorer = {
        enabled = false,
      },

      dashboard = {
        enabled = true,
      },

      lazygit = {
        configure = true,
        win = {
          position = "float",
          width = 0.9,
          height = 0.9,
          border = "rounded",
        },
      },
    },
  },
}
