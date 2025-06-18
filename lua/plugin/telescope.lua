return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          width = 0.6,
          height = 0.6,
          prompt_position = "top",
        },
        file_ignore_patterns = {
          "^.git/",
          "^.zsh_sessions/",
        },
        mappings = {
          n = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
          i = {
            ["<c-d>"] = require("telescope.actions").delete_buffer,
          },
        },
        find_command = { "fd", "-t=f", "-a" },
        path_display = { "absolute" },
        wrap_results = true,
      },
      extensions = {
        workspaces = {
          keep_insert = true,
        },
        fzf = {
          fuzzy = false,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "ignore_case",
        },
      },
    })

    telescope.load_extension("workspaces")
    telescope.load_extension("fzf")
    --telescope.load_extension("yank_history")

    local builtin = require("telescope.builtin")

    local find_word_in_file = function()
      builtin.current_buffer_fuzzy_find({})
    end

    local find_word = function()
      builtin.live_grep({})
    end

    local find_references = function()
      builtin.lsp_references({
        show_line = false,
      })
    end

    local find_buffers = function()
      builtin.buffers({})
    end

    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files hidden=true<CR>", {})
    vim.keymap.set("n", "<C-y>", "<cmd>Telescope yank_history<CR>", {})
    vim.keymap.set("n", "<C-f>", find_word_in_file, {})
    vim.keymap.set("n", "<C-o>", "<cmd>Telescope workspaces<CR>", {})
    vim.keymap.set("n", "<C-l>", find_word, {})
    vim.keymap.set("n", "<C-b>", find_buffers, {})
    vim.keymap.set("n", "<C-f-h>", builtin.help_tags, {})
    vim.keymap.set("n", "gr", find_references, {})
  end,
}
