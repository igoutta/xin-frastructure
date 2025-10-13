{
  flake.modules = {
    homeManager.cloud = 
    { pkgs, ...}:
    {
      programs.onedrive.enable = true;
      home.packages = [ pkgs.onedrivegui ];
    };
  };
}