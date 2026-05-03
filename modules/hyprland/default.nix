{ config, pkgs, ... }:

let
  terminal = "kitty";
  fileManager = "dolphin";
  menu = "hyprlauncher";
  webbrowser = "firefox";
in
  {
    programs.kitty.enable = true;
    # Electron things
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      enable = true;
      

      settings = {

        # Monitors
        # Check monitors using `hyprctl monitors`
        # Set monitor resolution using `hyprctl keyword monitor "..."
        monitor = [
          ",preferred,auto,auto"
          "Virtual-1,1920x1080@60,0x0,1"
        ];

        # Autostart
        exec-once = [
          "${terminal}"
          "firefox"
          "ashell"
          # "waybar"
          "dunst"
        ];

        # Environmental Variables
        # TODO: i dont think this is working
        env = [
          "XCURSOR_SIZE,6"
          "HYPRCURSOR_SIZE,6"
        ];

        # Window borders 
        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 1;

          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          # Mouse to resize windows
          resize_on_border = false;
          # Scren tearing
          allow_tearing = false;

          layout = "dwindle";
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
          force_split = 2; # Force split to right side
          single_window_aspect_ratio = "16 9";
        };

        # Autostart
        # TODO: figure out when to use togglefloating and dwindle
        "$mod" = "SUPER";
        bind = [
          "$mod, Q, exec, ${terminal}"
          "$mod, F, exec, ${webbrowser}"
          "$mod, C, killactive,"
          "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
          "$mod, E, exec, ${fileManager}" #TODO
          "$mod, V, togglefloating,"
          "$mod, R, exec, ${menu}" #TODO
          "$mod, P, pseudo, " # TODO
          "$mod, J, layoutmsg, togglesplit"

          # Move focus
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Move windows using shift+arrow keys
          "$mod SHIFT, Left, movewindow, l"
          "$mod SHIFT, Right, movewindow, r"
          "$mod SHIFT, Up, movewindow, u"
          "$mod SHIFT, Down, movewindow, d"

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

          # Scroll through workspaces
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          # Move active window to workspace
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

          # Submaps
          "ALT, R, submap, resize"
        ];

        # Move/resize windows using lmb/rmb
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };

      submaps = {
        "resize" = 
        let
          stepSize = "20";
        in {
          settings = {
            binde = [
              ",right,resizeactive,${stepSize} 0"
              ",left,resizeactive,-${stepSize} 0"
              ",up,resizeactive,0 -${stepSize}"
              ",down,resizeactive,0 ${stepSize}"
            ];

            bind = [
              ",escape,submap,reset"
            ];
          };
        };
      };
    };
  }
