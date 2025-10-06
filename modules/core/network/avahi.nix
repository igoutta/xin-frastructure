{
  flake.modules.nixos.core = {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;
    };
  };
}