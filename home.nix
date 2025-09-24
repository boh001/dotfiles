{ config, pkgs, lib, ... }:

{
  home.username = "sanghyeon";
  home.homeDirectory = "/home/sanghyeon";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
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

  home.pointerCursor = {
    enable = true;
    package = pkgs.catppuccin-cursors.mochaBlue;
    name = "catppuccin-mocha-blue-cursors";
    size = 24;
  };

  imports = [
    ./config/hypr
    ./config/nixvim
    ./config/bash.nix
    ./config/git.nix
    ./config/kitty.nix
    ./config/lazygit.nix
    ./config/yazi.nix
    ./config/zellij.nix
    ./config/firefox.nix
    ./config/waybar.nix
    ./config/rofi.nix
    ./config/dunst.nix
    ./config/fastfetch.nix
    ./config/bat.nix
    ./config/btop.nix
  ];
}
