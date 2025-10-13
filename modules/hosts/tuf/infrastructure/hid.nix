{
  flake.modules = {
    nixos."hosts/tuf" = {
      services.ratbagd.enable = true;
    };
    
    home-manager."hosts/tuf" = 
    { pkgs, ... }:
    {
      home.packages = [ pkgs.piper ];
    };
  };
}