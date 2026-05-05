return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = opts.window or {}
      opts.window.width = 25

      opts.default_component_configs = opts.default_component_configs or {}
      opts.default_component_configs.indent = {
        padding = 0,
      }
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "NONE", bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "NONE", bg = "NONE" })

      vim.opt.fillchars:append({
        vert = " ",
        eob = " ",
      })

      vim.opt.signcolumn = "no"
    end,
  },
}
