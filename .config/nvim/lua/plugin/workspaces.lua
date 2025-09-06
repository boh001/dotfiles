return {
  "natecraddock/workspaces.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("workspaces").setup({
      workspaces = {
        {
          name = "nvim",
          path = "~/.config/nvim",
        },
        {
          name = "project",
          path = "~/project",
        },
      },
      sort = false,
      hooks = {
        open = { "Telescope find_files hidden=true" },
      },
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      pattern = "*",
      callback = function()
        vim.cmd([[WorkspacesSyncDir]])
      end,
    })
  end,
}
