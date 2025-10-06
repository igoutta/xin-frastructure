{
  flake.modules.nixos.core = {
    security.rtkit.enable = true;
  };
}
