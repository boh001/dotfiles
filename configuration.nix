# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.resumeDevice = "/dev/disk/by-uuid/4362772e-769d-4c1e-8467-405d15af00ae";
  boot.kernelParams = [ "resume=/dev/disk/by-uuid/4362772e-769d-4c1e-8467-405d15af00ae" ];

  services.logind = {
    lidSwitch = "lock";
    lidSwitchExternalPower = "lock";
    lidSwitchDocked = "lock";
  };

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=30min
  '';

  powerManagement.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
    };
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Seoul";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.waylandFrontend = true;
      fcitx5.addons = with pkgs; [
        fcitx5-hangul
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.sanghyeon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland-uwsm.desktop'";
        user = "sanghyeon";
      };
    };
  };
}

