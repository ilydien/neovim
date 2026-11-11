-- Neo-tree sebagai file explorer, menggantikan snacks explorer.
-- Keymap di bawah dibuat semirip mungkin dengan snacks explorer.

--- Direktori dari node di bawah kursor (folder -> dirnya, file -> parent-nya)
---@param state table
---@return string
local function node_dir(state)
  local node = state.tree:get_node()
  local path = node and (node.path or node:get_id()) or state.path
  if path and vim.fn.isdirectory(path) == 1 then
    return path
  end
  return vim.fs.dirname(path or state.path)
end

--- Toggle gitignored files (padanan snacks `toggle_ignored`)
---@param state table
local function toggle_ignored(state)
  local filtered = state.filtered_items
  if filtered.visible then
    -- sedang menampilkan hidden + ignored: sembunyikan ignored saja
    filtered.visible = false
    filtered.hide_dotfiles = false
    filtered.hide_gitignored = true
  else
    filtered.hide_gitignored = not filtered.hide_gitignored
  end
  require("neo-tree.sources.filesystem.commands").refresh(state)
end

--- Tambah file/folder, folder ditandai dengan akhiran "/" (persis snacks)
---@param state table
local function add(state)
  local dir = node_dir(state)
  vim.ui.input({ prompt = 'Add a new file or directory (directories end with a "/"): ' }, function(value)
    if not value or value:match("^%s*$") then
      return
    end

    local path = vim.fs.normalize(dir .. "/" .. value)
    local is_file = value:sub(-1) ~= "/"

    if is_file and (vim.uv or vim.loop).fs_stat(path) then
      vim.notify("File already exists:\n- `" .. path .. "`", vim.log.levels.WARN)
      return
    end

    vim.fn.mkdir(is_file and vim.fs.dirname(path) or path, "p")
    if is_file then
      local file = io.open(path, "w")
      if file then
        file:close()
      end
    end

    require("neo-tree.sources.filesystem.commands").refresh(state)
  end)
end

--- Yank path node ke register + (padanan snacks `explorer_yank`)
---@param state table
local function yank(state)
  local node = state.tree:get_node()
  if not node then
    return
  end
  local path = node.path or node:get_id()
  if not path then
    return
  end
  vim.fn.setreg("+", path, "l")
  vim.notify("Yanked " .. path)
end

--- Paste file dari isi register + ke direktori node (padanan snacks `explorer_paste`)
---@param state table
local function paste(state)
  local dir = node_dir(state)
  local files = vim.split(vim.fn.getreg("+") or "", "\n", { plain = true })
  files = vim.tbl_filter(function(file)
    return file ~= "" and vim.fn.filereadable(file) == 1
  end, files)

  if #files == 0 then
    vim.notify("The `+` register does not contain any files", vim.log.levels.WARN)
    return
  end

  require("snacks").picker.util.copy(files, dir)
  require("neo-tree.sources.filesystem.commands").refresh(state)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        -- snacks explorer memakai hidden = true, ignored = true
        visible = true,
      },
    },
    window = {
      width = 35,
      mappings = {
        ["H"] = "toggle_hidden",
        ["I"] = toggle_ignored,
        ["-"] = "navigate_up",
        ["a"] = add,
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["p"] = paste,
        ["y"] = yank,
        ["."] = "set_root",
        ["<C-t>"] = function(state)
          require("snacks").terminal(nil, { cwd = node_dir(state) })
        end,
        ["<C-f>"] = function(state)
          require("snacks").picker.grep({ cwd = node_dir(state) })
        end,
        ["O"] = "open_with_window_picker",
      },
    },
  },
}
