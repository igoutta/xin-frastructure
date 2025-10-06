{
  flake.modules = {
    homeManager.onedrive = 
    { pkgs, ...}:
    {
      programs.onedrive.enable = true;
      home.packages = [ pkgs.onedrivegui ];
    };
  };
}