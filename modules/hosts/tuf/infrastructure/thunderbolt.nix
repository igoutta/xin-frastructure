{
  flake.modules = {
    nixos."hosts/tuf" = {
      services.hardware.bolt.enable = true;
    };
    
    home-manager."hosts/tuf" = 
    { pkgs, ... }:
    {
      home.packages = [ pkgs.thunderbolt ];
    };
  }
}