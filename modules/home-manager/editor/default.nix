{ config, pkgs, ...}:

{
  programs.vim = {
    enable = true;

    extraConfig = ''
      set nu rnu
    '';
  };
}
