{
  flake.modules.nixos.core =
    { hostConfig, ... }:
    {
      networking = {
        hostName = hostConfig.name;

        networkmanager = {
          enable = true;
        };

        iproute2.enable = true;

        useDHCP = true;

        # firewall = {
        #   enable = true;
        #   allowedTCPPorts = [ 22 ];
        #   allowedUDPPorts = [ 5353 ];
        # };
      };

      systemd = {
        services.NetworkManager-wait-online.enable = false;
        network.wait-online.enable = false;
      };

      services.resolved = {
        enable = true;
      };
    };
}
