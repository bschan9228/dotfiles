{ config, pkgs, ... }:

{
  programs.kitty.enable = true;
  # Electron things
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Q, exec, kitty"
      ];

      # Check monitors using `hyprctl monitors`
      # Set monitor resolution using `hyprctl keyword monitor "..."
      monitor = [
        "Virtual-1,1920x1080@60,0x0,1"
      ];
    };
  };
}
