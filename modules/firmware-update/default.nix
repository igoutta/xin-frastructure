{
  flake.modules.nixos.firmware-update = {
    services = {
      fwupd = {
        enable = true;
      };
    };
  };
}
