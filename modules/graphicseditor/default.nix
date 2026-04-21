{ config, pkgs, ... }:

{
  xdg.configFile."inkscape/templates/default.svg".source =
    ./inkscape_template.svg;
}
