return {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
