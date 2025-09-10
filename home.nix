{ config, pkgs, ... }:

{
	home.username = "sanghyeon";
	home.homeDirectory = "/home/sanghyeon";
	home.stateVersion = "25.05";
	  gtk = {
    enable = true;
    theme = {
      name = "Materia-dark"; 
package = pkgs.materia-theme;
    };
  };

	programs.git.enable = true;

	home.file.".gitconfig".source = ./config/.gitconfig;
	home.file.".bashrc".source = ./config/.bashrc;

	xdg.configFile."nvim" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/nvim";
		recursive = true;
	};

	xdg.configFile."kitty" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/kitty";
		recursive = true;
	};

	xdg.configFile."yazi" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/yazi";
		recursive = true;
	};

	xdg.configFile."lazygit" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/lazygit";
		recursive = true;
	};

	xdg.configFile."hypr" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/hypr";
		recursive = true;
	};

	xdg.configFile."waybar" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/waybar";
		recursive = true;
	};

	xdg.configFile."dunst" = {
		source = config.lib.file.mkOutOfStoreSymlink "/home/sanghyeon/dotfiles/config/dunst";
		recursive = true;
	};
}
