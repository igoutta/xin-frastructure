{
  flake.modules = {
    homeManager.gui = 
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        vivaldi
        vivaldi-ffmpeg-codecs
      ];
      
      programs.vivaldi.nativeMessagingHosts = [
        pkgs.kdePackages.plasma-browser-integration
      ];
    };
  };
}