{
  flake.modules.nixos.virtualisation = {
    hardware.nvidia-container-toolkit.enable = true;
  };
}