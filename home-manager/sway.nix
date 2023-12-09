{ config, pkgs, lib, ...}:
{
  wayland = {
    windowManager = {
      sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        package = (pkgs.swayfx.overrideAttrs (old: { passthru.providedSessions = ["sway"]; }));
        config = rec {
          modifier = "Mod4";
          menu = "rofi -show drun";
          keybindings = let
            modifier = config.wayland.windowManager.sway.config.modifier;
          in lib.mkOptionDefault {
            "${modifier}+Shift+q" = "kill";
            "${modifier}+Shift+e" = "mode $mode_shutdown";
            "${modifier}+Shift+c" = "reload";
            "${modifier}+Shift+r" = "restart";
            "${modifier}+l" = "exec $locking";
            "${modifier}+h" = "splith";
            "${modifier}+v" = "splitv";
            "${modifier}+c" = "exec $browser";
            "${modifier}+m" = "exec io.elementary.files";
            "${modifier}+b" = "exec brightnessctl -d tpacpi::kbd_backlight set 2";
            "${modifier}+n" = "exec code ~/.config/nixos";
            "${modifier}+Shift+u" = "exec alacritty --class float -o window.dimensions.lines=15 -o window.dimensions.columns=140 -e sudo nixos-rebuild switch --flake ~/.config/nixos/.# --impure";
            "${modifier}+d" = "exec rofi -show run";
            "${modifier}+1" = "output * scale 1.0";
            "${modifier}+2" = "output * scale 1.1";
            "${modifier}+3" = "output * scale 1.4";
            "${modifier}+4" = "output * scale 1.5";
            "${modifier}+5" = "output * scale 2.0";
            "${modifier}+Shift+p" = "exec grim -g ''$(slurp) - | swappy -f -";
            "Ctrl+Escape" = "exec makoctl dismiss -a";
            "Ctrl+1" = "workspace number 1";
            "Ctrl+2" = "workspace number 2";
            "Ctrl+3" = "workspace number 3";
            "Ctrl+4" = "workspace number 4";
            "Ctrl+5" = "workspace number 5";
            "Ctrl+6" = "workspace number 6";
            "Ctrl+7" = "workspace number 7";
            "Ctrl+8" = "workspace number 8";
            "Ctrl+9" = "workspace number 9";
            "Ctrl+Left" = "workspace prev";
            "Ctrl+Right" = "workspace next";
            "Ctrl+Mod1+1" = "move container to workspace 1";
            "Ctrl+Mod1+2" = "move container to workspace 2";
            "Ctrl+Mod1+3" = "move container to workspace 3";
            "Ctrl+Mod1+4" = "move container to workspace 4";
            "Ctrl+Mod1+5" = "move container to workspace 5";
            "Ctrl+Mod1+6" = "move container to workspace 6";
            "Ctrl+Mod1+7" = "move container to workspace 7";
            "Ctrl+Mod1+8" = "move container to workspace 8";
            "Ctrl+Mod1+9" = "move container to workspace 9";
            "Ctrl+Mod1+Left" = "move container to workspace prev";
            "Ctrl+Mod1+Right" = "move container to workspace next";
          };
          startup = [
            { command = "avizo-service"; }
            { command = "mako"; }
            { command = "echo 'on' | sudo tee /sys/bus/usb/devices/3-10/power/control"; }
            { command = "udiskie"; }
            { command = "gnome-keyring-daemon"; }
            { command = ''
                dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway && \
                systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr && \
                systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
              '';
            }
          ];
          window = {
            border = 1;
          };
          bars = [
            {
              position = "top";
              command = "waybar";
            }
          ];
          focus = {
            followMouse = false;
          };
          gaps = {
            inner = 8;
            outer = 4;
            smartGaps = false;
          };
          input = {
            "type:touchpad" = {
              tap = "enabled";
              natural_scroll = "disabled";
              dwt = "disabled";
            };
          };
          terminal = "alacritty --working-directory ~/Development/projects";
          output = {
            eDP-1 = {
              scale = "1.0";
              bg = "${config.xdg.configHome}/wallpaper.png fill";
            };
          };
        };
        extraConfig = (builtins.readFile ../sway/config);
      };
    };
  };
}