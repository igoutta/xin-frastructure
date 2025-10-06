{
  flake.modules.nixos."hosts/apollo" = {
    fileSystems."/" =
      { device = "/dev/disk/by-uuid/1e335c8d-7b05-4c0e-b3b2-4a22239f8af3";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/DD83-89CA";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    fileSystems."/home" =
      { device = "/dev/disk/by-uuid/72399f82-0374-406f-95b8-45e64804e834";
        fsType = "ext4";
      };

    swapDevices = [ ];
  };
}
