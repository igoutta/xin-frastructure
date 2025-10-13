{
  flake.modules = {
    homeManager.terminal = 
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        doge
        microfetch #TODO: edit config
      ];

      programs.fastfetch.enable = true;
    };
  };
}