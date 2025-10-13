{
  inputs,
  ...
}:
{
  flake.modules = {
    nixos.core = {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];
    };

    homeManager.core =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        age
        ssh-to-age
        ssh-to-pgp
      ];
    };
  };
}
