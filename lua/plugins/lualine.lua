return {
  "nvim-lualine/lualine.nvim",
  version = false,

  opts = {
    always_show_tabline = false,
    options = {
      component_separators = nil,
      section_separators = { left = "", right = "" },
    },
    theme = {
      normal = { c = { bg = "NONE", fg = "NONE" }, z = { bg = "NONE", fg = "NONE" } },
      inactive = { c = { bg = "NONE", fg = "NONE" }, z = { bg = "NONE", fg = "NONE" } },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" } } },
      lualine_b = { { "branch", separator = { right = "" } }, { "diff", separator = { left = "" } } },
      lualine_c = { { draw_empty = false, color = { fg = "NONE", bg = "NONE", gui = "italic,bold" } } },
      lualine_x = { { draw_empty = false, color = { fg = "NONE", bg = "NONE", gui = "italic,bold" } } },
      lualine_y = {
        { "diagnostics", separator = { right = "" } },
        { "lsp_status", separator = { right = "", left = "" } },
        { "progress", separator = { left = "" } },
      },
      lualine_z = {
        { "location", separator = { right = "" } },
      },
    },
  },
}
