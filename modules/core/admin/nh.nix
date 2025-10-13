{
  inputs,
  ...
}:
{
  imports = [
    inputs.make-shell.flakeModules.default
  ];

  flake.modules.nixos.core = {
    programs = {
      nh = {
        enable = true;
        clean = {
          enable = true;
          extraArgs = "--keep 2";
        };
      };
    };
  };

  perSystem =
  { pkgs, ... }:
  {
    make-shells.default.packages = with pkgs; [ nh ];
  };
}
