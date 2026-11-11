return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Section default lualine (seperti tampilan standar)
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      -- lualine_y = { "progress" },
      lualine_z = { "location" },
    }

    -- Buang extension "neo-tree" supaya panel tree ikut menampilkan lualine penuh.
    -- LazyVim default: { "neo-tree", "lazy", "fzf" }
    opts.extensions = { "lazy" }

    -- Separator rounded, bukan segitiga powerline
    opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    })
  end,
}
