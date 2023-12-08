{ config, pkgs, lib, ...}:
{
  home = {
    packages = with pkgs; [
      git
      alacritty
      capitaine-cursors
      qogir-theme
      qogir-icon-theme
      dconf
      eza
      bat
      rm-improved
      zsh-powerlevel10k
      rofi-wayland
      waybar
      kubectl
      kubernetes-helm
      azure-cli
      gh
      jq
      devbox
      lens
      telepresence2
      vscode
      xdg-utils
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
      avizo
      pulseaudio
      brightnessctl
      gnome.gnome-keyring
      grim
      slurp
      wl-clipboard
      swappy
      udiskie
      waybar-mpris
      pantheon.elementary-files
      (python3.withPackages(ps: with ps; [requests]))
      nodejs
      killall
    ];
  };
}