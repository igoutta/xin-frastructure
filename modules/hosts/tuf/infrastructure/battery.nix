{
  flake.modules.nixos."hosts/tuf" =
  { pkgs, ... }:
  {
    hardware.asus.battery =
    {
      chargeUpto             = 85;   # Maximum level of charge for your battery, as a percentage.
      enableChargeUptoScript = true; # Whether to add charge-upto to environment.systemPackages. `charge-upto 85` temporarily sets the charge limit to 85%.
    };

    boot.kernelModules = [ "i2c-dev" ];
    hardware.i2c.enable = true;
    services.udev.packages = [ pkgs.openrgb ];
    services.hardware.openrgb.enable = true;
  };
}
