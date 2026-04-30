{ config, pkgs, ... }:

let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "hyprlauncher:";
  webbrowser = "firefox";
in
  {
    programs.kitty.enable = true;
    # Electron things
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      enable = true;
      

      settings = {

        # Check monitors using `hyprctl monitors`
        # Set monitor resolution using `hyprctl keyword monitor "..."
        monitor = [
          ",preferred,auto,auto"
          "Virtual-1,1920x1080@60,0x0,1"
        ];

        exec-once = [
          "${terminal}"
          "firefox"
        ];

        # Autostart
        "$mod" = "SUPER";
        bind = [
          "$mod, Q, exec, ${terminal}"
          "$mod, F, exec, ${webbrowser}"
          "$mod, C, killactive,"
          "$mod, E, exec, ${fileManager}"
          "$mod, V, togglefloating,"
          "$mod, J, layoutmsg, togglesplit"

          # Move focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Switch workplaces
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
        ];

        general = {
          layout = "dwindle";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
      };

    };
  }
