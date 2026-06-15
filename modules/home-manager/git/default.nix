{ config, pkgs, ...}:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "bschan9228";
      user.email = "bschan9228@gmail.com";

      init.defaultBranch = "main";
    };
  };
}
