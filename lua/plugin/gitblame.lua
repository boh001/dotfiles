return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false,
  },
  config = function()
    vim.api.nvim_set_var('gitblame_message_template', '<committer>, <sha> (<committer-date>)')
    vim.api.nvim_set_var('gitblame_date_format', '%r')
  end
}
