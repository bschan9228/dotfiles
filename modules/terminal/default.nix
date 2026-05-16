{ config, pkgs, ... }:

{
  #TODO: cursor changes to beam when enabled. Should be bar
  programs.bash = {
    # enable = true;

    initExtra = ''
      set -o vi
    '';
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      set -g prefix C-b
      set -g mouse on

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };
}
