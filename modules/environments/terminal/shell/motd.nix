{
  flake.modules = {
    homeManager.terminal = {
      home.packages = with pkgs; [
        doge
        microfetch
      ];

      programs.fastfetch.enable = true;
    };
  };
}