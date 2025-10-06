{
  flake.modules = {
    homeManager.environments.terminal = {
      home.packages = with pkgs; [
        doge
        microfetch
      ];

      programs.fastfetch.enable = true;
    };
  };
}