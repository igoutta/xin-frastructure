{
  inputs,
  ...
}:
{
  # imports = [
  #   inputs.chaotic.nixosModules.default
  # ];

  flake.modules.nixos.core.boot =
    { pkgs, ... }: {
      kernelPackages = pkgs.linuxPackages_latest; #pkgs.linuxPackages_cachyos-lto.cachyOverride { mArch = "GENERIC_V4"; };

      kernelParams = [
        "nowatchdog"
        "quiet"
        "splash"
      ];
    };  
}
