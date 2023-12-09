{ config, pkgs, lib, ...}:
{
  programs = {
    zsh = {
      enable = true;
      history = {
        path = "${config.xdg.dataHome}/zsh/history";
        size = 10000;
      };
      shellAliases = {
        svc = "sudo systemctl";
        kube = "kubectl";
        ls = "exa --git --color=always --icons -l --group-directories-first";
        cat = "bat --theme ansi";
        rm = "rip";
        tf = "terraform";
        tp = "telepresence";
        up = "pushd ~/.config/nixos > /dev/null && git add . && sudo nixos-rebuild switch --flake .# --impure && popd > /dev/null";
        ne = "code ~/.config/nixos";
        box = "devbox shell --pure";
      };
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting = {
        enable = true;
      };
      initExtra = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        source ${config.xdg.configHome}/nixos/.p10k.zsh
        function gcap() {
          git add .
          git commit -m "$1"
          git push origin -u $(git rev-parse --abbrev-ref HEAD)
        }
        path+=("/home/barath/.local/bin")
        export PATH
        unset -m POWERLEVEL9K_AZURE_SHOW_ON_COMMAND
        unset -m POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND
        typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
        typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
        typeset -g POWERLEVEL9K_NIX_SHELL_CONTENT_EXPANSION='[daato]'
        typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
          os_icon
          dir
          vcs
          prompt_char
        )
        typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
          status
          azure
          kubecontext
          telepresence
        )
      '';
    };
  };
}