{
  flake.modules.nixos.core = {
    system.autoUpgrade = {
      enable = false;
      # flake = "github:drupol/infra";
      allowReboot = true;
    };
  };
}
