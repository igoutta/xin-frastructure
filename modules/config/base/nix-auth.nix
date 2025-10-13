{ inputs, ... }:
{
  imports = [
    inputs.make-shell.flakeModules.default
  ];

  perSystem = 
  { system, ... }: 
  {
    make-shells.default.packages = [ 
      inputs.nix-auth.packages.${system}.default
    ];
  };
}
