return {
  "saghen/blink.cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({
            paths = { vim.fn.stdpath("config") .. "/snippets" },
          })

          local extends = {
            typescript = { "tsdoc" },
            javascript = { "jsdoc" },
            lua = { "luadoc" },
            python = { "pydoc" },
            rust = { "rustdoc" },
            cs = { "csharpdoc" },
            java = { "javadoc" },
            c = { "cdoc" },
            cpp = { "cppdoc" },
            php = { "phpdoc" },
            kotlin = { "kdoc" },
            ruby = { "rdoc" },
            sh = { "shelldoc" },
          }
          -- friendly-snippets - enable standardized comments snippets
          for ft, snips in pairs(extends) do
            require("luasnip").filetype_extend(ft, snips)
          end
        end,
      },
      opts = { history = true, delete_check_events = "TextChanged" },
    },
  },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },
    keymap = {
      preset = "default",
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },

    -- 자동완성 설정
    completion = {
      documentation = {
        auto_show = true, -- 문서 자동 표시
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
