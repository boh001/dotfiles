{ config, pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./auto-save.nix
    ./indent-blankline.nix
    ./fidget.nix
    ./nvim-tree.nix
    ./web-devicons.nix
    ./lsp.nix
    ./snacks.nix
    ./toggleterm.nix
    ./telescope.nix
    ./projections.nix
    ./yanky.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    opts = {
      number = true;
      mouse = "a";
      shiftwidth = 2;
      expandtab = true;
      tabstop = 2;
      smartcase = true;
      smartindent = true;
      showtabline = 2;
      swapfile = false;
      wrap = false;
      encoding = "utf-8";
      autoread = true;
      termguicolors = true;
      numberwidth = 5;
      cursorline = true;
    };
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = ":bd<CR>";
        options.silent = true;
      }
    ];
    globals = {
      mapleader = ",";
    };
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          accent = "blue";
        };
      };
    };
  };
}

