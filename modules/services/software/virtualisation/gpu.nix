{
  flake.modules.nixos.containing = {
    hardware.nvidia-container-toolkit.enable = true;
  };
}