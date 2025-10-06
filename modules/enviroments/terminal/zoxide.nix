{
  flake.modules = {
    homeManager.environments.terminal = {
      programs = {
        zoxide = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}