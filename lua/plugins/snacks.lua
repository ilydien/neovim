return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = true, -- 🔥 NYALAIN LAGI
        replace_netrw = true,
      },

      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            auto_close = true,
            git_status = true,
            tree = true,
            follow_file = true,

            layout = {
              layout = {
                position = "left",
              },
            },

            win = {
              list = {
                keys = {
                  ["H"] = "toggle_hidden",
                  ["I"] = "toggle_ignored",
                  ["-"] = "explorer_up",
                  ["a"] = "explorer_add",
                  ["d"] = "explorer_del",
                  ["r"] = "explorer_rename",
                  ["c"] = "explorer_copy",
                  ["p"] = "explorer_paste",
                  ["y"] = "explorer_yank",
                  ["."] = "explorer_focus",
                  ["<C-t>"] = "terminal",
                  ["<C-f>"] = "grep",
                  ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },

      dashboard = {
        enabled = true,
      },
    },
  },
}