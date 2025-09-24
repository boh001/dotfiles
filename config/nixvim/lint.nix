{
  programs.nixvim = {

    plugins.lint = {
      enable = true;

      lintersByFt = {
        nix = [ "nix" ];
      };
    };
    extraConfigLua = ''
      local lint = require("lint")

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    '';
  };
}
