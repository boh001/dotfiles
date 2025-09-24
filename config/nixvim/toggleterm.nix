{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
    };

    extraConfigLua = ''
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        hide_number = false,
      })
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<C-]>", [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, "n", "<C-]>", ":q<CR>", opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      local Terminal = require("toggleterm.terminal").Terminal
      local claude = Terminal:new({ cmd = "claude", hidden = true, count = 6 })
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, count = 7 })

      function _claude_toggle()
        claude:toggle()
      end

      function _lazygit_toggle()
        lazygit:toggle()
      end

      vim.keymap.set("n", "<leader>1", ":1ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>2", ":2ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>3", ":3ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>4", ":4ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>5", ":5ToggleTerm<CR>", { noremap = true, silent = true })
      vim.keymap.set(
        "n",
        "<leader>cc",
        "<cmd>lua _claude_toggle()<CR>",
        { noremap = true, silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>lg",
        "<cmd>lua _lazygit_toggle()<CR>",
        { noremap = true, silent = true }
      )    '';
  };
}


