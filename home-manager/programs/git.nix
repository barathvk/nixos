{ config, pkgs, lib, ...}:
{
  programs = {
    git = {
      enable = true;
      userName = "Barath Kumar";
      userEmail = "barathvk@gmail.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };
}