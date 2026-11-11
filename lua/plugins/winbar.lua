return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    lazy = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = "auto",
      show_dirname = false,
      show_basename = true,
      show_modified = true,
      exclude_filetypes = {
        "neo-tree",
        "lazy",
        "mason",
        "help",
        "terminal",
        "snacks_dashboard",
        "snacks_picker_list",
        "snacks_picker_input",
        "snacks_picker_preview",
        "snacks_terminal",
        "Trouble",
        "trouble",
        "noice",
        "notify",
        "qf",
      },
      symbols = {
        separator = "",
        modified = "●",
        ellipsis = "…",
      },
    },
  },
}
