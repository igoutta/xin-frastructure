{ inputs, ... }:
{
  flake.modules = {
    nixos.hardware = {
      imports = [ inputs.nixos-facter-modules.nixosModules.facter ];
      facter.detected.dhcp.enable = false;
    };

    homeManager.hardware =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ nixos-facter ];
      };
  };
}
