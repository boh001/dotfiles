{ config
, pkgs
, lib
, ...
}:

{
  home.username = "sanghyeon";
  home.homeDirectory = "/Users/sanghyeon";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    fastfetch
    nixpkgs-fmt
    bat
    zoxide
    fzf
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      v = "vim";
      y = "yazi";
      z = "zoxide";
      f = "fzf";
      ff = "fastfetch";
    };
  };

  programs.git = {
    enable = true;
    userName = "sanghyeon";
    userEmail = "boh001g@gmail.con";
    extraConfig = {
      credential.helper = "store";
    };
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      ignorecase = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      number = true;
      mouse = "a";
    };
    extraConfig = ''
      set clipboard=unnamedplus
    '';
  };

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };
}
