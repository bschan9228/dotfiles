{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "bschan9228";
        email = "bschan9228@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "vim";
    };

    ignores = [
      # vim
      "*~"
      "*.swp"
      "*.swo"

      # emacs
      "\#*\#"

      # misc
      "*_temp*"
      "*temp_*"
    ];
  };
}
