{
  flake.modules = {
    nixos.environments.terminal = {
      programs.zsh.enable = true;
    };

    homeManager.environments.terminal =
    { config, pkgs, ... }:
    {
      home = {
        shell.enableZshIntegration = true;
        packages = with pkgs; [ 
          pay-respects # unfuck poorly written commands
          tlrc # tl;dr in rust - Tealdeer alternative
        ];
      };

      programs.zsh = {
        enable = true;
        dotDir = "${config.xdg.configHome}/zsh";
        sessionVariables = {
          EDITOR = "hx";
        };
        envExtra = 
        ''
          eval "$(pay-respects zsh)"
        '';

        enableCompletion = true;
        dirHashes = {
          nixconf = "/etc/nixos";
        };
        autosuggestion = {
          enable = true;
          strategy = [ "match_prev_cmd" ];
        };
        syntaxHighlighting.enable = true;

        history = {
          path = "${config.xdg.dataHome}/zsh/zsh_history";
          extended = true; # Enable timestamp
          append = true;
          share = true;
          size = 10000;
          ignoreDups = true;
          ignoreSpace = true;
          expireDuplicatesFirst = true;
          saveNoDups = true;
        };

        # set some aliases, feel free to add more or remove some
        shellAliases = {
          ".." = "cd ..";
          "..." = "cd ../..";
          nano = "micro";
          ls = "eza";
          grep = "rg";
          htop = "btop";
          lolcat = "dotacat";

          rebuild = "sudo nixos-rebuild";
          update = ''cd /etc/nixos && 
          nix flake update && 
          sudo nixos-rebuild switch && 
          cd -'';
          clean-nixos-generations = "sudo nix-collect-garbage --delete-old"; 
          
          k = "kubectl";
          urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
          urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
        };
        shellGlobalAliases = {
          UUID = "$(uuidgen | tr -d \\n)";
          G = "| grep";	
        };

        oh-my-zsh = {
          enable = true;
          #custom = "${config.home.homeDirectory}/.oh-my-zsh/custom";
          #theme = "headline";
          plugins = [
            "aliases" "zbell"

            "starship"

            "battery"

            "zoxide" "zsh-navigation-tools" "zsh-interactive-cd" "eza" "fzf"

            "sudo" "man" "tldr" "web-search"

            "systemd" "arduino-cli" "nmap"

            "git" "git-prompt"

            "uv" "python"

            "ssh-agent" "mosh"
          ];
          extraConfig = 
          ''
            #~~~~~ Plugin: python
            PYTHON_VENV_NAME=".venv"
            PYTHON_VENV_NAMES=($PYTHON_VENV_NAME venv)
            PYTHON_AUTO_VRUN=true
            #~~~~~ Plugin: ssh-agent
            zstyle :omz:plugins:ssh-agent quiet yes
            zstyle :omz:plugins:ssh-agent lazy yes
            #~~~~~ Plugin: zbell
            zbell_duration=30
            #~~~~~ Plugin:eza
            #zstyle ':omz:plugins:eza' 'git-status' yes
            zstyle ':omz:plugins:eza' 'dirs-first' yes
            zstyle ':omz:plugins:eza' 'header' yes
            #zstyle ':omz:plugins:eza' 'icons' yes
            #zstyle ':omz:plugins:eza' 'color-scale' all
            zstyle ':omz:plugins:eza' 'time-style' relative 
          '';
        };
      };
    };
  };
}