{ config, pkgs, lib, ... }:

{
  imports = [
    ./home-manager/home.nix
    ./home-manager/packages.nix
    ./home-manager/gtk.nix
    ./home-manager/sway.nix
    ./home-manager/programs/git.nix
    ./home-manager/programs/alacritty.nix
    ./home-manager/programs/firefox.nix
    ./home-manager/programs/zsh.nix
  ];
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
