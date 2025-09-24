local options = {
  number = true,
  clipboard = "unnamed",
  shiftwidth = 2, -- Change a number of space characters inserted for indentation
  expandtab = true,
  tabstop = 2,
  smartcase = true,
  smartindent = true,
  showtabline = 2, -- Always show tabs
  swapfile = false,
  wrap = false,
  encoding = "utf-8",
  autoread = true,
  termguicolors = true,
  numberwidth = 5,
  cursorline = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
