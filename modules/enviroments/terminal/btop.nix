{
  flake.modules = {
    homeManager.environments.terminal =
    { pkgs, ... }:
    {
      programs = {
        btop = {
          enable = true;
          package = pkgs.btop-cuda; #I have Nvidia
          settings = {
            color_theme = "Default";
            theme_background = false;
            proc_tree = true;
          }
        };
      };
    };
  };
}