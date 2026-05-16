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
      set -g mode-keys vi

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
  };
}
