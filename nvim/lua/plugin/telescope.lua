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
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg", "svg", "gif"} -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "timg",
                "-pk",
                filepath, -- Terminal image viewer command
              }, { on_stdout = send_output, stdout_buffered = true, pty = true })
            else
              require("telescope.previewers.utils").set_preview_message(
                bufnr,
                opts.winid,
                "Binary cannot be previewed"
              )
            end
          end,
        },
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
    telescope.load_extension("yank_history")


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
