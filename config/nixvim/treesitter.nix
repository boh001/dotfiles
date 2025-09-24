{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [ ];

    settings = {
      ensureInstalled = [ ];

      highlight = {
        enable = true;

        additional_vim_regex_highlighting = [
          "ruby"
        ];
      };

      indent = {
        enable = true;
        disable = [
          "ruby"
        ];
      };
    };
  };
}
