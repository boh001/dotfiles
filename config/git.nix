{ config, pkgs, ... }:

{

  programs.git = {
    enable = true;
    userName = "sanghyeon.kim";
    userEmail = "boh001g@gmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

}
