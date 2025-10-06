{ 
  lib, 
  ... 
}:
{
  flake.modules.nixos."hosts/tuf" =
  { config, pkgs, ... }:
  {
    services.xserver.videoDrivers = [
      "modesetting"
      "nvidia"
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver # Enable Hardware Acceleration
        vpl-gpu-rt # Enable QSV
        vaapiIntel # TODO: try for mpv player with hwdec=yes
      ];
    };

    # Accelerated Video Playback implementations
    # environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optional for Intel
    # environment.variables.LIBVA_DRIVER_NAME = "nvidia"; # Experimental
    
    hardware.nvidia = {
      modesetting.enable = true;
      open = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };

    specialisation = {
      workstation.configuration = {
        system.nixos.tags = [ "Workstation" ];
        hardware.nvidia = {
          powerManagement.finegrained = lib.mkForce false;
          prime.offload.enable = lib.mkForce false;
          prime.offload.enableOffloadCmd = lib.mkForce false;
          prime.sync.enable = lib.mkForce true;
        };
      };
    };
  };

  nixpkgs.allowedUnfreePackages = [
    "nvidia"
    "nvidia-x11"
    "nvidia-settings"
  ];
}