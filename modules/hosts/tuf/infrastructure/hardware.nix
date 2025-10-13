{
  inputs,
  ...
}:
{
  flake.modules.nixos."hosts/tuf" = {
    imports = with inputs.nixos-hardware.nixosModules; [
      common-pc-ssd
      # asus-fx506hm #TODO: Extract everything necessary XD
    ];
  };
}
