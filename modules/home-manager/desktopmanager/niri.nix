{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    fuzzel
    waybar
    mako
    swaylock
    swayidle
    xwayland-satellite
  ];

}
