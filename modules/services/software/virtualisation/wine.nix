{
  flake.modules.homeManager.containing = 
    { pkgs, ... }:
    {
    home.packages = with pkgs; [
      wineWowPackages.yabridge
      wineWowPackages.fonts
      winetricks
      # q4wine # CMAKE 3.5 issue
    ]; #TODO: make shells and settings

    programs.lutris.enable = true;
    #services.wine = {
    #  enable = true;
    #  settings = {
    #    yabridge = {
    #      enable = true;
    #      autoImport = true;
    #      autoUpdate = true;
    #      autoExport = true;
    #      use32Bit = true;
    #      use64Bit = true;
    #      useStaging = false;
    #      useEsync = true;
    #      useFsync = false;
    #      debug = false;
    #      verbose = false; # very verbose logging
    #      dllOverrides = [ "xaudio2_7=n,b" "d3dcompiler_43=n,b" "d3d11=n,b" "dxgi=n,b  " ];
    #    };
    #  };
    #
  };
}