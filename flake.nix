{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    inputs@{ self
    , nix-darwin
    , nixpkgs
    , home-manager
    , nix-homebrew
    , homebrew-core
    , homebrew-cask
    ,
    }:
    let
      configuration =
        { pkgs, config, ... }:
        {
          environment.systemPackages = with pkgs; [
            vim
          ];

          nix.settings.experimental-features = "nix-command flakes";

          nixpkgs.hostPlatform = "aarch64-darwin";

          system.configurationRevision = self.rev or self.dirtyRev or null;

          system.stateVersion = 6;

          system.primaryUser = "sanghyeon";

          security.pam.services.sudo_local.touchIdAuth = true;

          system.defaults = {
            NSGlobalDomain.ApplePressAndHoldEnabled = false;
            finder.AppleShowAllFiles = true;
            finder.AppleShowAllExtensions = true;
            screencapture.location = "~/Pictures/Screenshots";

            dock = {
              autohide = true;
              mru-spaces = false;
              persistent-apps = [ ];
            };
          };

          nix-homebrew = {
            enable = true;
            user = "sanghyeon";

            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
            };
          };

          homebrew = {
            enable = true;
            onActivation = {
              autoUpdate = true;
              upgrade = true;
              cleanup = "uninstall";
            };
            taps = builtins.attrNames config.nix-homebrew.taps;
            brews = [
              "fnm"
              "mas"
              "claude-cmd"
            ];
            casks = [
              "google-chrome"
              "visual-studio-code"
              "aldente"
              "chatgpt"
              "claude"
            ];
            masApps = {
              KakaoTalk = 869223134;
              CleanMyMac = 1339170533;
            };
          };
        };
    in
    {
      darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          configuration
          home-manager.darwinModules.home-manager
          {
            users.users.sanghyeon.home = "/Users/sanghyeon";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sanghyeon = import ./home.nix;
          }
        ];
      };
    };
}
