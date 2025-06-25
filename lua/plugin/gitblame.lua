return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    require("gitblame").setup({
      enabled = false
    })
    vim.api.nvim_set_var('gitblame_message_template', '<committer>, <sha> (<committer-date>)')
    vim.api.nvim_set_var('gitblame_date_format', '%r')
  end
}
