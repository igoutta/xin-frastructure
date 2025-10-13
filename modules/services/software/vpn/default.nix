{
  flake.modules.nixos.vpn = {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      #port = 0;
      openFirewall = true;
    };
  };
}
