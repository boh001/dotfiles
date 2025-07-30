return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = require("config.lsp.servers"),
      automatic_installation = true,
    })
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "js-debug-adapter",
      },
      automatic_installation = true,
    })
    require("mason-tool-installer").setup({
      ensure_installed = { "stylua", "prettierd" },
    })
  end,
}
