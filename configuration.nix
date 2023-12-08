{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
     gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-then 7d";
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball { url = "https://github.com/nix-community/NUR/archive/d854884a8c7d2014ff44a27cfe9cac8dd78cc7ea.tar.gz"; sha256 = "1cvsb8qvy3zgv2gd1c79p096g7arlb7n7qdhv88zmisll2z8dz7k";}) {
          inherit pkgs;
        };
      };
    };
  };
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Hasklig" ]; })
      noto-fonts
      noto-fonts-emoji
      hasklig
      font-awesome
      hackgen-nf-font
      lxappearance
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Hasklig" ];
        emoji = [ "Noto Emoji" ];
      };
    };
  };
  sound = {
    enable = true;
  };
  hardware = {
    opengl = {
      enable = true;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
  networking = {
    hostName  = "barath-laptop";
    networkmanager = {
      enable = true;
    };
  };
  time = {
    timeZone = "Europe/Berlin";
  };
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };
  security = {
    sudo = {
      wheelNeedsPassword = true;
    };
    polkit = {
      enable = true;
    };
  };
  users.users.barath = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Barath Kumar";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
  programs = {
    zsh = {
      enable = true;
    };
  };
  services = {
    getty = {
      autologinUser = "barath";
    };
  };
  virtualisation = {
    docker = { 
      enable = true;
    };
  };
  system.stateVersion = "23.11";
}