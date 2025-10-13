{
  lib,
  ...
}:
{
  flake.modules.nixos."hosts/tuf" = {
    boot = {
      loader = {
        efi.canTouchEfiVariables = true;
        limine = {
          enable = true;
          efiSupport = true;
          maxGenerations = 14;
          enableEditor = false;
          style = {
            wallpapers = [ "/boot/wallpapers/EVA-01-red-shadow.png" ];
            wallpaperStyle = "streched";
            interface = {
              resolution = "1920x1080";
              helpHidden = lib.mkForce true;
              branding = "GA.";
              brandingColor = 7; # White
            };
            graphicalTerminal = {
              palette = ''
              212121;
              FA203D;
              40FA89;
              655C47;
              2F46A3;
              8A32BD;
              61B5C2;
              515151'';
              brightPalette = ''
              848BA2;
              F77798;
              77F788;
              FAE7B1;
              7793F7;
              B340D6;
              83DADB;
              F0F0F0'';
              background = "E0212121";
              font.scale = "2x2";
            };
          };
          extraEntries = ''
          /Arch Linux
            protocol: linux
            path: boot():/vmlinuz-linux
            cmdline: root=PARTUUID=dfd6be5a-949f-4785-bba3-5914f71c5d8b rw initrd=\intel-ucode.img nowatchdog
            module_path: boot():/initramfs-linux.img
            
          /Windows
            comment: "GA Workbook"
            protocol: efi
            path: uuid(bd757982-2127-446a-8906-e6bedebe8e17):/EFI/Microsoft/Boot/bootmgfw.efi
          '';
        };
      };

      kernel = {
        sysctl = {
          #"net.ipv4.conf.all.forwarding" = lib.mkForce true;
          #"net.ipv6.conf.all.forwarding" = lib.mkForce true;
        };
      };

      initrd.availableKernelModules = [
        "xhci_pci"
        "thunderbolt"
        "nvme"
        "usb_storage"
        "sd_mod"
      ];

      initrd.kernelModules = [ ];
      kernelModules = [ "kvm-intel" ];
      extraModulePackages = [ ];

      hardware.cpu.intel.updateMicrocode = lib.mkForce true;
    };
  };
}