{ config, pkgs, ... }:

{
  xdg.configFile."inkscape/templates/default.svg".source =
    ./default.svg;
}
