{
  flake.modules.nixos.bluetooth = 
  { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      bluetui
      bluetooth_battery
      
      nerd-fonts.fira-code
      nerd-fonts.symbols-only
    ];

    hardware.bluetooth = {
      enable = true;
      package = pkgs.bluez-experimental;
      powerOnBoot = false;
      hsphfpd.enable = true;
      settings = {
        General = {
          ControllerMode = "dual";
          FastConnectable = true;
          Privacy = "limited-device";
          Experimental = true;
          KernelExperimental = true;
        };
      };
    };
  };
}
