# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.access-tokens = "github.com=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";

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    limine = {
      enable = true;
      efiSupport = true;
      maxGenerations = 14;
      enableEditor = false;
      style = {
        wallpapers = [ "/boot/wallpapers/aesthetic-firewood.png" ];
        wallpaperStyle = "streched";
        interface = {
      	  resolution = "1920x1080";
      	  helpHidden = true;
      	  branding = "GΔ.";
      	  brandingColor = 3;
        };
        graphicalTerminal = {
          palette = "212121;FA203D;40FA89;655C47;2F46A3;8A32BD;61B5C2;515151";
          brightPalette = "848BA2;F77798;77F788;FAE7B1;7793F7;B340D6;83DADB;F0F0F0";
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

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_cachyos-lto;

  networking.hostName = "ga"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Guayaquil";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_EC.UTF-8";
    LC_IDENTIFICATION = "es_EC.UTF-8";
    LC_MEASUREMENT = "es_EC.UTF-8";
    LC_MONETARY = "es_EC.UTF-8";
    LC_NAME = "es_EC.UTF-8";
    LC_NUMERIC = "es_EC.UTF-8";
    LC_PAPER = "es_EC.UTF-8";
    LC_TELEPHONE = "es_EC.UTF-8";
    LC_TIME = "es_EC.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [
    "modesetting"
  	"nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = true;

    powerManagement = {
      enable = false;
      finegrained = false;
    };
    
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      sync.enable = true;
    };
  };

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];
      hardware.nvidia = {
        powerManagement.enable = lib.mkForce true;
        powerManagement.finegrained = lib.mkForce true;
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
    };
  };

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "latam";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "la-latin1";

  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr pkgs.epson-escpr2 ];
    cups-pdf.enable = true;
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Configure Command Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ga = {
    isNormalUser = true;
    description = "ga";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "tty"
      "libvirtd"
    ];
    packages = with pkgs; [
      kdePackages.kate

      geoclue2
      qgroundcontrol
      # kdePackages.kamoso
      # thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "ga";

  # Onedrive customization
  services.onedrive.enable = true;
  #services.onedrive.package = pkgs.onedrive;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
	  wineWowPackages.yabridge
	  wineWowPackages.fonts
	  winetricks
	  q4wine

	  #vkd3d
	  #protontricks
	  #zenity #YAD replacement
	  #yazi #nnn replacement

    efibootmgr
    lshw

    wget
	  git

    uv
    migrate-to-uv

    micro
    bat

    onedrive
    onedrivegui

    vivaldi
    vivaldi-ffmpeg-codecs
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.geoclue2 = {
    enable = true;
    enableWifi = true;
    appConfig.qgroundcontrol = {
      isSystem = false;
      isAllowed = true;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
  	enable = true;
	  startWhenNeeded = true;
	  ports = [ 22 ];
	  settings = {
	    PasswordAuthentication = true;
	    AllowUsers = [ "ga" ]; # Allows all users by default. Can be [ "user1" "user2" ]
	    UseDns = true;
	    X11Forwarding = false;
	    PermitRootLogin = "no";
	  };
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
