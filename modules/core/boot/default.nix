{
  flake.modules.nixos.core.boot = {
    initrd.systemd.enable = true;

    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}
