return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "n",
      desc = "Format buffer",
    },
  },
  config = function()
    require("conform").setup({
      -- 파일 타입별 포매터 설정
      formatters_by_ft = {
        lua = { "stylua" },
      },
      -- 포매터 설정 (선택사항)
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces" },
        },
      },
    })
  end,
}
