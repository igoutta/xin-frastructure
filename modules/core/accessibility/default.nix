{
  flake.modules.nixos.core = {
    services.orca.enable = false;
    services.speechd.enable = false;
  };
}
