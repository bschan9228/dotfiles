{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "bschan9228";
    userEmail = "bschan9228@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
