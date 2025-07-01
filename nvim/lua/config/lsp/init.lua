-- *
vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- lua
local lua_ls = require("config.lsp.lua_ls")

vim.lsp.config.lua_ls = lua_ls
vim.lsp.enable("lua_ls")

-- typescript
local ts_ls = require("config.lsp.ts_ls")

vim.lsp.config.ts_ls = ts_ls
vim.lsp.enable("ts_ls")

-- eslint
local eslint = require("config.lsp.eslint")
vim.lsp.config.eslint = eslint
vim.lsp.enable("eslint")

-- html
local html = require("config.lsp.html")
vim.lsp.config.html = html
vim.lsp.enable("html")

-- css
local cssls = require("config.lsp.cssls")
vim.lsp.config.cssls = cssls
vim.lsp.enable("cssls")

-- tailwindcss
local tailwindcss = require("config.lsp.tailwindcss")
vim.lsp.config.tailwindcss = tailwindcss
vim.lsp.enable("tailwindcss")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  end,
})
