{
  flake.modules = {
    homeManager.development = {
      programs = {
        lazygit = {
          enable = true;
          settings = {
            git.overrideGpg = true;
          };
        };
      };
    };
  };
}
