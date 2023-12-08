{ config, pkgs, lib, ...}:
{
  home = {
    username = "barath";
    homeDirectory = "/home/barath";
    stateVersion = "23.11";
    sessionVariables = {
      GTK_THEME = "Qogir-Dark";
    };
    pointerCursor = {
      gtk = {
        enable = true;
      };
      x11 = {
        enable = true;
        defaultCursor = "capitaine-cursors";
      };
      name = "capitaine-cursors";
      size = 16;
      package = pkgs.capitaine-cursors;
    };
    file = {
      hushlogin = {
        text = "";
        target = "${config.home.homeDirectory}/.hushlogin";
      };
      nanorc = {
        text = ''
          set tabsize 2
          set tabstospaces
        '';
        target = "${config.home.homeDirectory}/.nanorc";
      };
      waybar = {
        source = lib.cleanSource ../waybar;
        target = "${config.xdg.configHome}/waybar";
        recursive = true;
      };
      rofi = {
        source = lib.cleanSource ../rofi;
        target = "${config.xdg.configHome}/rofi";
        recursive = true;
      };
      mako = {
        source = lib.cleanSource ../mako;
        target = "${config.xdg.configHome}/mako";
        recursive = true;
      };
      wallpaper = {
        source = lib.cleanSource ../wallpaper.png;
        target = "${config.xdg.configHome}/wallpaper.png";
      };
    };
  };
}