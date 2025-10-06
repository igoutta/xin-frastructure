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
        # key = "0AAF2901E8040715"; # ed25519/0x0AAF2901E8040715
        # keygrip = [
        #   "143BC4FB7B3AC7C4F902ADCB579D2F66CDA1844A" # rsa4096/0xD476DFE9C67467CA
        # ];
        # authorizedKeys = [
        #   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDfxTd6cA45DZPJsk3TmFmRPu1NQQ0XX0kow18mqFsLLaxiUQX1gsfW1kTVRGNh4s77StdsmnU/5oSQEXE6D8p3uEWCwNL74Sf4Lz4UyzSrsjyEEhNTQJromlgrVkf7N3wvEOakSZJICcpl05Z3UeResnkuZGSQ6zDVAKcB3KP1uYbR4SQGmWLHI1meznRkTDM5wHoiyWJnGpQjYVsRZT4LTUJwfhildAOx6ZIZUTsJrl35L2S81E6bv696CVGPvxV+PGbwGTavMYXfrSW4pqCnDPhQCLElQS4Od1qMicfYRSmk/W2oAKb8HZwFoWQSFUStF8ldQRnPyn2wiBQnhxnczt2jUhq1Uj6Nkq/edb1Ywgn7jlBR4BgRLD3K3oMvzJ/d3xDHjU56jc5lCA6lFLDMBV6Q9DKzMwL2jG3aQbehbUwTz7zbUwAHlCFIY5HGs4d9veXHyCsUikCLPvHL/hQU/vFRHHB7WNEyQJZK+ieOAW+un+1eF88iyKsOXE9y8PjLvXYcPHdzGaQKnqzEJSQcTUw9QSzOZQQpmpy8z6Lf08D2I4GHq1REp6d4krJOOW0gXadjsGEhLqQqWGnHE47QBPnlHlDWzOaf3UX59rFsl8xZDXoXzzwJ1stpeJx+Tn/uSNnaf44yXFyeFK/IDUeOrXYD4fSTLP1P/lCFCfeYqw== (none)"
        # ];
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
          # openssh.authorizedKeys.keys = config.flake.meta.users.ga.authorizedKeys;
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
