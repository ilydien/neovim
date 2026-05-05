return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = true,
    window = {
      width = 25,
    },
    filesystem = {
      use_libuv_file_watcher = true,
      follow_current_file = true,
      group_empty_dirs = false,
      use_recycle_bin = false,
    },
  },
}
