return {
  "akinsho/bufferline.nvim",
  priority = 1000,

  opts = function(_, opts)
    opts.options.close_icon = "×"
    opts.options.buffer_close_icon = "×"
    opts.options.modified_icon = "●"
    opts.options.separator_style = "thin"

    opts.options.custom_areas = {
      left = function()
        return { { text = " ", padding = 20 } }
      end,
      right = function()
        return { { text = " ", padding = 20 } }
      end,
    }
  end,
}
