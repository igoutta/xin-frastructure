{
  flake.modules.nixos.virtualisation = {
    environment.systemPackages = with pkgs; [
      wineWowPackages.yabridge
      wineWowPackages.fonts
      winetricks
      q4wine
    ]; #TODO: make shells and settings
  };
}