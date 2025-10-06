{
  flake.modules = {
    homeManager.environments.terminal = {
      programs = {
        fzf = {
          enable = true;
          enableZshIntegration = true;
        };
      };
    };
  };
}