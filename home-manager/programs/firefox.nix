{ config, pkgs, lib, ...}:
{
  programs = {
    firefox = {
      enable = true;
      policies = {
        BlockAboutConfig = false;
      };
      profiles.default = {
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = (builtins.readFile ../../firefox/user-chrome.css);
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          darkreader
          tridactyl
          proton-pass
        ];
      };
    };
  };
}