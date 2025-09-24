return {
  "rachartier/tiny-code-action.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  event = "LspAttach",
  config = function()
    vim.keymap.set("n", "<leader>a", function()
      require("tiny-code-action").code_action({
        picker = {
          "select"
        }
      })
    end, { noremap = true, silent = true })
  end,
}
