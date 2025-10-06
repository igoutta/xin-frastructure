{
  flake.modules = {
    homeManager.environments.terminal = {
      programs = {
        nix-your-shell = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}