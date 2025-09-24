{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "vim";
      f = "fastfetch";
      y = "yazi";
      lg = "lazygit";
      cc = "claude";
      zj = "zellij";
    };
    bashrcExtra = ''
      fastfetch 
    '';
    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
