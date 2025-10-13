{
  config,
  ...
}:
{
  flake = {
    meta.users = {
      ga = {
        email = "igoutta@protonmail.com";
        name = "Gustavo Alvarado";
        username = "ga";
        key = "AAAAC3NzaC1lZDI1NTE5AAAAIF6CvTLKiOX4SQ1HUaIe1zDzyUFRlC7WFOHkUhui9Zkq"; # ed25519/0x0AAF2901E8040715
        keygrip = [
          "AE06FA81A5FB3544B110AA55BAA06CBC81364CCC" # rsa4096/0xD476DFE9C67467CA
        ];
        authorizedKeys = [
          
        ];
      };
    };

    modules.nixos.ga =
      { pkgs, ... }:
      {
        users.users.ga = {
          description = config.flake.meta.users.ga.name;
          isNormalUser = true;
          createHome = true;
          extraGroups = [
            "audio"
            "input"
            "libvirtd"
            "network"
            "networkmanager"
            "sound"
            "tty"
            "wheel"
          ];
          shell = pkgs.zsh;
          environment.pathsToLink = [ "/share/zsh" ];
          openssh.authorizedKeys.keys = config.flake.meta.users.ga.authorizedKeys;
          initialPassword = "123456";
        };

        services.displayManager.autoLogin = { #TODO: put in other place
          enable = true;
          user = "ga";
        };

        nix.settings.trusted-users = [ config.flake.meta.users.ga.username ];

        home-manager.users.ga = {
          home.file = {
            ".face" = {
              source = ../../../resources/ga/.face;
              recursive = true;
            };
            ".face.icon" = {
              source = ../../../resources/ga/.face;
              recursive = true;
            };
            "Pictures/Backgrounds/" = {
              source = ../../../resources/Backgrounds;
              recursive = true;
            };
          };
        };
      };
  };
}
