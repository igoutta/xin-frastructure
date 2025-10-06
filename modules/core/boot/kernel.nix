{
  inputs,
  ...
}:
{
  imports = [
    inputs.chaotic.nixosModules.default
  ];

  flake.modules.nixos.core.boot =
    { pkgs, ... }: {
      kernelPackages = pkgs.linuxPackages_cachyos-lto;

      kernelParams = [
        "nowatchdog"
        "quiet"
        "splash"
      ];
    };  
}
