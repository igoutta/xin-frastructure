{
  flake.modules.nixos.core = 
  { pkgs, ... }: {
    console = {
      earlySetup = true;
      packages = [ pkgs.terminus_font ];
      font = null;
      useXkbConfig = true;
    };
  };
}
