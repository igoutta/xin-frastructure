{
  flake.modules = {
    homeManager.environments.graphical = 
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