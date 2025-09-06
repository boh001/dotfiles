return {
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform" },
  docs = {
    description = [[
https://github.com/terraform-linters/tflint

A pluggable Terraform linter that can act as lsp server.
Installation instructions can be found in https://github.com/terraform-linters/tflint#installation.
]],
  },
}
