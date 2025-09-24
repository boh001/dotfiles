{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "vim";
      f = "fastfetch";
      y = "yazi";
      g = "lazygit";
      cc = "claude";
    };
    bashrcExtra = ''
      fastfetch 
    '';
    sessionVariables = {
      EDITOR = "vim";
    };
  };
}
