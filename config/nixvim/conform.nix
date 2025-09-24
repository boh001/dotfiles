{ pkgs, ... }:
{
  programs.nixvim = {
    extraPackages = with pkgs; [
      prettierd
      taplo
      nixpkgs-fmt
    ];

    plugins.conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          javascript = [ "prettierd" ];
          typescript = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
          html = [ "prettierd" ];
          css = [ "prettierd" ];
          json = [ "prettierd" ];
          yaml = [ "prettierd" ];
          taplo = [ "prettierd" ];
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action.__raw = ''
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end
        '';
        options = {
          desc = "[F]ormat buffer";
        };
      }
    ];
  };
}
