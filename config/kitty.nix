{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 14;
    };
    settings = {
      background_opacity = "0.85";
      background_blur = 20;
    };
  };
}
