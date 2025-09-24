{ config, pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/.dotfiles/wallpaper.png"
      ];
      wallpaper = [
        ",~/.dotfiles/wallpaper.png"
      ];
    };
  };
}
