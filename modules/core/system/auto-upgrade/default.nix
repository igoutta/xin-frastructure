{
  flake.modules.nixos.core = {
    system.autoUpgrade = {
      enable = false;
      flake = "github:igoutta/nix-frastructure";
      allowReboot = true;
    };
  };
}
