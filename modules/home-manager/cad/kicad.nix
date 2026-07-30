{ config, pkgs, ... }:

{
  #TODO: design rule templates?
  home.file.".config/kicad/10.0/eeschema.json".source =
    config.lib.file.mkOutOfStoreSymlink
      #TODO: this path needs to be relative
      # This is impure but can't do anything about it
      "${config.home.homeDirectory}/.dotfiles/modules/home-manager/cad/kicad/eeschema.json";
}
