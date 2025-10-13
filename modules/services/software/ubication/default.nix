{ lib, ... }:
{
  flake.modules.nixos.ubication = {
    options.location = {
      latitude = lib.mkOption {
        type = lib.types.numbers.between (-90) 90;
        default = -2.12;
      };
      longitude = lib.mkOption {
        type = lib.types.numbers.between (-180) 180;
        default = 79.85;
      };
    };

    services.geoclue2 = {
      enable = true;
      enableWifi = true;
      whitelistedAgents = [
        "qgroundcontrol"
      ];
      # appConfig.qgroundcontrol = {
      #   isSystem = false;
      #   isAllowed = true;
      # };
    };
  };
}