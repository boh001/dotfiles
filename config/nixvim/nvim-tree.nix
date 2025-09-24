{
  programs.nixvim = {
    plugins.nvim-tree.enable = true;

    extraConfigLua = ''
      -- Netrw 비활성화 및 컬러 설정
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- 키맵 설정 함수
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- 기본 키맵 로드
        api.config.mappings.default_on_attach(bufnr)

        -- 커스텀 키맵
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "<C-o>", api.node.open.tab, opts("Open: New Tab"))
        vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
        vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
        vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
        vim.keymap.set("n", "<C-t>", api.tree.close, opts("Close"))
        vim.keymap.set("n", "<C-r>", api.tree.reload, opts("Refresh"))
        vim.keymap.set("n", "a", api.fs.create, opts("Create"))
        vim.keymap.set("n", "d", api.fs.trash, opts("Delete"))
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
        vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
      end

      local HEIGHT_RATIO = 0.8 -- You can change this
      local WIDTH_RATIO = 0.8 -- You can change this too

      -- nvim-tree 설정
      require("nvim-tree").setup({
        on_attach = on_attach,
        view = {
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
        },
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        filters = {
          git_ignored = false,
          dotfiles = false,
        },
        git = {
          enable = false,
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
          ignore_dirs = { "node_modules" },
        },
        trash = {
          cmd = "trash", -- macOS: trash, Linux: gio trash
        },
      })

      -- 전역 키맵
      vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
      vim.keymap.set("n", "<C-h>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus nvim-tree" })
    '';
  };
}

