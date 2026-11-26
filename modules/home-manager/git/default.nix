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
      # remote.origin.fetch = "+refs/heads/*:refs/remotes/origin/*"; # git worktree fetch. may error out git clone.

      pull.ff = "only";
      # config.pull.rebase = true; # might be better to do ff only

      extraConfig = {
        # use ssh later. im lazy
        github.protocol = "https";
      };
    };

    ignores = [
      # vim
      "*~"
      ".*"
      "!*.example"
      "!.gitignore"
      "!.envrc"

      # emacs
      "\#*\#"

      # misc
      "*temp_*"
    ];
  };
}
