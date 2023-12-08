{ config, pkgs, lib, ...}:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        cursor = {
          unfocused_hollow = false;
          style = {
            shape = "Underline";
            blinking = "Always";
          };
        };
        window = {
          opacity = 0.8;
          padding = {
            x = 6;
            y = 6;
          };
        };
      };
    };
  };
}