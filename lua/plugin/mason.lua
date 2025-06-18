return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "tailwindcss", "eslint" },
      automatic_installation = true,
    })
    require("mason-tool-installer").setup({
      ensure_installed = { "stylua", "prettierd" },
    })
  end,
}
