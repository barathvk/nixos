{ config, pkgs, lib, ...}:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Qogir-dark";
      package = pkgs.qogir-icon-theme;
    };
    theme = {
      name = "Qogir-Dark";
      package = pkgs.qogir-theme;
    };
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}