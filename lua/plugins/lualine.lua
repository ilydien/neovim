return {
  "nvim-lualine/lualine.nvim",
  version = false,

  opts = {
    always_show_tabline = false,

    options = {
      component_separators = "",
      section_separators = { left = "", right = "" },
    },

    theme = {
      normal = {
        c = { bg = "NONE", fg = "NONE" },
        z = { bg = "NONE", fg = "NONE" },
      },
      inactive = {
        c = { bg = "NONE", fg = "NONE" },
        z = { bg = "NONE", fg = "NONE" },
      },
    },

    sections = {
      lualine_a = {
        {
          "mode",
          separator = { right = "" },
        },
      },

      lualine_b = {
        {
          "branch",
          separator = { left = "", right = "" },
        },
      },

      lualine_c = {},

      lualine_x = {
        {
          "datetime",
          format = "%A, %B %d | %H:%M",
          separator = { left = "", right = "" },
        },
      },

      lualine_y = {
        {
          "lsp_status",
          separator = { left = "", right = "" },
        },
      },

      lualine_z = {
        {
          "location",
        },
      },
    },
  },
}
