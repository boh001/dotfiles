{ config, pkgs, lib, ... }:

{
  home.username = "sanghyeon";
  home.homeDirectory = "/home/sanghyeon";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nixpkgs-fmt
    nerd-fonts.jetbrains-mono
    pavucontrol
    claude-code
    trash-cli
    brightnessctl
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  gtk = {
    enable = true;
  };

  imports = [
    ./config/hypr/hyprland.nix
    ./config/hypr/hyprpaper.nix
    ./config/hypr/hyprlock.nix
    ./config/hypr/hypridle.nix
    ./config/bash.nix
    ./config/git.nix
    ./config/kitty.nix
    ./config/lazygit.nix
    ./config/yazi.nix
    ./config/firefox.nix
    ./config/waybar.nix
    ./config/rofi.nix
    ./config/dunst.nix
    ./config/fastfetch.nix
    ./config/bat.nix
    ./config/btop.nix
  ];
}
